package ruleengine

import (
	"github.com/flexibleir/compliance/constants/compliancetype"
	"github.com/flexibleir/compliance/constants/scanstatus"
	"github.com/flexibleir/compliance/data/logindetails"
	"github.com/flexibleir/compliance/data/scanresultsmap"
	"github.com/flexibleir/compliance/execution"
	"errors"
	"io/ioutil"
	"os"
	"path"
	"strings"
)

// ScriptPaht - script folder path
var ScriptPath = ""

var scriptPath1 = "../../scripts" // for running in debug mode.
var scriptPath2 = ".././scripts"  // for running in UT.
var scriptPath3 = "/scripts"      // for running in container.

func SetScriptPath() {
	if ScriptPath != "" {
		return
	}
	if _, err := os.Stat(scriptPath1); !os.IsNotExist(err) {
		ScriptPath = scriptPath1
		return
	}
	if _, err := os.Stat(scriptPath2); !os.IsNotExist(err) {
		ScriptPath = scriptPath2
		return
	}
	if _, err := os.Stat(scriptPath2); !os.IsNotExist(err) {
		ScriptPath = scriptPath2
		return
	}
}

// RunRules - runes the rules based on compliance type
func RunRules(login *logindetails.LoginDetails, scanResult *scanresultsmap.ScanResult) error {
	var folderPath string

	SetScriptPath()

	if scanResult.ComplianceType == compliancetype.CiS {
		folderPath = path.Join(ScriptPath, "/cis/mini")
	} else if scanResult.ComplianceType == compliancetype.PcI {
		folderPath = path.Join(ScriptPath, "/pci/mini")
	} else if scanResult.ComplianceType == compliancetype.Lynis {
		folderPath = path.Join(ScriptPath, "/lynis/mini")
		execution.CopyFile(path.Join(ScriptPath, "lynis/lynis-remote.tar.gz"), "/tmp/lynis-remote.tar.gz", login)
	} else {
		return errors.New("github.com/flexibleir/compliance type not supported")
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
			scanResult.Results[file.Name()] = "Error-" + err.Error()
			scanResult.ErrorMessage = err.Error()
		} else {
			scanResult.Results[file.Name()] = strings.Trim(output, "\n")
		}
	}
	scanResult.ScanStatus = scanstatus.Completed
	return nil
}
