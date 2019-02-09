package ruleengine

import (
	"compliance/constants/compliancetype"
	"compliance/data/scanresultsmap"
	"compliance/test/testutils"
	"testing"
)

var credential = testutils.Credential

func TestRuleEngine(t *testing.T) {
	scriptPath := ".././scripts/cis/mini/disable_freevxfs.sh"
	var credential = testutils.Credential
	login := credential

	scanResult := scanresultsmap.ScanResult{
		ComplianceType: compliancetype.CiS,
	}

	err := RunRules(compliancetype.CiS, login, &scanResult)
	if err != nil {
		t.Errorf("Execute failed for command %s with error", scriptPath)
		t.Error(err)
	}
}
