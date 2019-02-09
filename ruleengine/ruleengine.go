package ruleengine

import (
	"compliance/constants/compliancetype"
	"compliance/data/logindetails"
	"compliance/data/scanresultsmap"
	"compliance/execution"
	"errors"
	"io/ioutil"
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

	for _, file := range files {
		execution.ExecuteScriptRemote(file.Name(), login)
	}

	return nil
}
