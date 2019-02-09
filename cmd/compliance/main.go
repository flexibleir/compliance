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
	"compliance/ruleengine"
	"flag"
	"log"
	"os/exec"

	"github.com/go-openapi/loads"
	"github.com/go-openapi/runtime/middleware"
	"github.com/go-openapi/swag"
)

var portFlag = flag.Int("port", 8080, "Port to run this service on")
var idMap = make(map[string]string)

func main() {
	swaggerSpec, err := loads.Analyzed(restapi.SwaggerJSON, "")
	if err != nil {
		log.Fatalln(err)
	}
	api := operations.NewComplianceAPI(swaggerSpec)

	server := restapi.NewServer(api)
	defer server.Shutdown()

	flag.Parse()
	server.Port = *portFlag

	// need to define api's in this place
	api.ComplianceGetIDHandler = compliance.GetIDHandlerFunc(
		func(params compliance.GetIDParams) middleware.Responder {
			id := swag.StringValue(&params.ID)
			if id == "" {
				id = "0"
			}
			var hostname string
			scanResult, err := scanresultsmap.GetScanResult(id)
			if err != nil {
				hostname = "error - id is wrong"
			}

			results := models.Ruleresultarray{}
			for key, value := range scanResult.Results {

				result := models.Ruleresult{Result: value, Rulename: key}
				results = append(results, &result)
			}
			job := &models.Getjob{ID: id, Hostname: hostname, Progress: 100, Result: results}
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
			if hostName == "" {
				hostName = "localhost"
			}
			userName := swag.StringValue(params.Body.Username)
			if userName == "" {
				userName = "root"
			}
			password := swag.StringValue(params.Body.Password)
			if password == "" {
				password = "password"
			}
			job := &models.Createjob{ID: id, Hostname: &hostName, Username: &userName, Password: &password}

			scanResult := scanresultsmap.ScanResult{
				ComplianceType: compliancetype.CiS,
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
