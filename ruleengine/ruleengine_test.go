package ruleengine

import (
	"github.com/flexibleir/compliance/constants/compliancetype"
	"github.com/flexibleir/compliance/constants/scanstatus"
	"github.com/flexibleir/compliance/data/scanresultsmap"
	"github.com/flexibleir/compliance/test/testutils"
	"fmt"
	"testing"

	"github.com/stretchr/testify/assert"
)

var credential = testutils.Credential

func TestRuleEngine(t *testing.T) {
	var credential = testutils.Credential
	login := credential

	scanResult := scanresultsmap.ScanResult{
		ComplianceType: compliancetype.CiS,
		Results:        make(map[string]string),
	}

	err := RunRules(login, &scanResult)
	if err != nil {
		t.Errorf("Execute failed for command %s with error", ScriptPath)
		t.Error(err)
	}

	for _, value := range scanResult.Results {
		assert.True(t, value == "Passed" || value == "Failed")
	}

	assert.Equal(t, scanstatus.Completed, scanResult.ScanStatus)
}

func TestLynis(t *testing.T) {
	var credential = testutils.Credential
	scanResult := scanresultsmap.ScanResult{
		ComplianceType: compliancetype.Lynis,
		Results:        make(map[string]string),
	}

	err := RunRules(credential, &scanResult)
	if err != nil {
		t.Errorf("Execute failed for command %s with error", ScriptPath)
		t.Error(err)
	}

	for _, value := range scanResult.Results {
		fmt.Print(value)
	}
}
