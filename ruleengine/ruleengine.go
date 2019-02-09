package ruleengine

import (
	"compliance/constants/compliancetype"
	"compliance/constants/scanstatus"
	"compliance/data/logindetails"
	"compliance/data/scanresultsmap"
	"compliance/execution"
	"errors"
	"io/ioutil"
	"path"
	"strings"
)

// RunRules - runes the rules based on compliance type
func RunRules(comType compliancetype.ComplianceType, login *logindetails.LoginDetails, scanResult *scanresultsmap.ScanResult) error {
	var folderPath string
	if comType == compliancetype.CiS {
		folderPath = ".././scripts/cis/mini"
	} else if comType == compliancetype.PcI {
		folderPath = ".././scripts/pci/mini"
	} else {
		return errors.New("Compliance type not supported")
	}

	files, err := ioutil.ReadDir(folderPath)
	if err != nil {
		return err
	}
	scanResult.TotalRules = len(files)
	scanResult.ScanStatus = scanstatus.InProgress

	for _, file := range files {
		output, err := execution.ExecuteScriptRemote(path.Join(folderPath, file.Name()), login)
		if err != nil {
			scanResult.Results[file.Name()] = "Error"
		} else {
			scanResult.Results[file.Name()] = strings.Trim(output, "\n")
		}
	}
	scanResult.ScanStatus = scanstatus.Completed
	return nil
}
