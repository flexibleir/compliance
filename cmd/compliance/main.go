package main

import (
	"compliance/constants/compliancetype"
	"compliance/constants/scanstatus"
	"compliance/data/logindetails"
	"compliance/data/scanresultsmap"
	"compliance/gen/models"
	"compliance/gen/restapi"
	"compliance/gen/restapi/operations"
	"compliance/gen/restapi/operations/compliance"
	"compliance/restclient/flexibleirclient"
	"compliance/ruleengine"
	"flag"
	"fmt"
	"log"
	"os/exec"
	"strings"

	"github.com/go-openapi/loads"
	"github.com/go-openapi/runtime/middleware"
	"github.com/go-openapi/swag"
)

var portFlag = flag.Int("port", 8080, "Port to run this service on")
var fleibleiruser = flag.String("flexibleiruser", "", "FlesibleIR username - which will be used to create tickets.")
var flesibleirpassword = flag.String("flexibleirpassword", "", "FlesibleIR password - which will be used to create tickets.")

func main() {
	swaggerSpec, err := loads.Analyzed(restapi.SwaggerJSON, "")
	if err != nil {
		log.Fatalln(err)
	}
	api := operations.NewComplianceAPI(swaggerSpec)

	server := restapi.NewServer(api)
	defer server.Shutdown()

	flag.Parse()
	printMessageAboutFlesibleIrFlags()
	server.Port = *portFlag

	// need to define api's in this place
	api.ComplianceGetIDHandler = compliance.GetIDHandlerFunc(
		func(params compliance.GetIDParams) middleware.Responder {
			id := swag.StringValue(&params.ID)
			if id == "" {
				id = "0"
			}
			var errorMessage string
			scanResult, err := scanresultsmap.GetScanResult(id)
			if err != nil {
				errorMessage = "error - id is wrong"
				fmt.Println(errorMessage)
			}

			results := models.Ruleresultarray{}
			for key, value := range scanResult.Results {

				result := models.Ruleresult{Result: value, Rulename: key}
				results = append(results, &result)
			}

			var progress int64
			if scanResult.TotalRules == 0 {
				progress = 0
			} else {
				progress = (int64)(len(scanResult.Results)/scanResult.TotalRules) * 100
			}
			var scanType string
			if scanResult.ComplianceType == compliancetype.CiS {
				scanType = "CiS"
			} else {
				scanType = "PcI"
			}

			job := &models.Getjob{ID: id, Hostname: scanResult.HostName, Progress: progress,
				Result: results, Compliancetype: scanType, Scanstatus: "Completed", boardurl: getFlexibleIrBoardLink()}
			return compliance.NewGetIDOK().WithPayload(job)
		})

	api.ComplianceCreateHandler = compliance.CreateHandlerFunc(
		func(params compliance.CreateParams) middleware.Responder {

			// remove known hosts in the compliance system
			rmcmd := "rm /root/.ssh/known_hosts -f"
			rmcmd1 := exec.Command("sh", "-c", rmcmd)
			rmcmd1.CombinedOutput()

			id := swag.StringValue(&params.Body.ID)
			if id == "" {
				id = "0"
			}
			hostName := swag.StringValue(params.Body.Hostname)
			userName := swag.StringValue(params.Body.Username)
			password := swag.StringValue(params.Body.Password)
			complianceTypeRequest := swag.StringValue(params.Body.Compliancetype)
			job := &models.Createjob{ID: id, Hostname: &hostName, Username: &userName, Password: &password}

			var comType compliancetype.ComplianceType

			if strings.EqualFold("cis", complianceTypeRequest) {
				comType = compliancetype.CiS
			} else {
				comType = compliancetype.PcI
			}

			scanResult := scanresultsmap.ScanResult{
				HostName:       hostName,
				ComplianceType: comType,
				Results:        make(map[string]string),
			}
			retrivedScanResult := scanresultsmap.AddOrUpdatedScanResult(id, scanResult)
			login := logindetails.CreateLoginDetails(hostName, userName, password)
			err := ruleengine.RunRules(login, &retrivedScanResult)

			if err != nil {
				retrivedScanResult.ScanStatus = scanstatus.Failed
				retrivedScanResult.ErrorMessage = err.Error()
			}

			scanresultsmap.AddOrUpdatedScanResult(id, retrivedScanResult)

			return compliance.NewCreateCreated().WithPayload(job)
		})

	if err := server.Serve(); err != nil {
		log.Fatalln(err)
	}
}

func printMessageAboutFlesibleIrFlags() {
	if !isFlexibleIrMode() {
		fmt.Printf("Flesible Ir UserName or Password is not passed so wont be creating tickets after the scan")
	} else {
		fmt.Printf("FlexibleIr UserName - %s, Password %s, will be used to create tickets after the scan.", *fleibleiruser, *flesibleirpassword)
	}
}

func isFlexibleIrMode() bool {
	if *fleibleiruser == "" || *flesibleirpassword == "" {
		return false
	}
	return true
}

func getFlexibleIrBoardLink() string {
	var flexibleIrBoardFormat = "https://board.flexibleir.com/b/%s/1"
	if !isFlexibleIrMode() {
		return ""
	}
	_, body, _ := flexibleirclient.Login(*fleibleiruser, *flesibleirpassword)

	if !body.Success {
		fmt.Println("Unable to Login to Flexible Ir using this credential.")
		return ""
	}
	token := body.Response.Token
	fmt.Println(token)

	request := &flexibleirclient.CreateIncidentDetails{
		Description:       "CIS:Scan ID:12 ",
		UserID:            32,
		ReportedBy:        "By Docker Container",
		ReportedByEmail:   "docker@flexibleir.com",
		ReportedByContact: "123456789",
		APICall:           true,
		Severity:          "HIGH",
		Businessline:      "",
		Category:          "TemplateKanban",
	}
	_, response, _ := flexibleirclient.CreateIncident(token, request)

	if !response.Success {
		fmt.Println("Unable to create ticket in flexible ir.")
		return ""
	}

	boardURL := fmt.Sprintf(flexibleIrBoardFormat, response.BoardID)
	fmt.Printf("FlexibleIr board link - %s\n", boardURL)
	return boardURL
}
