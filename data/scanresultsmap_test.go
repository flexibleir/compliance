package scanresultsmap

import (
	"testing"

	uuid "github.com/satori/go.uuid"
	"github.com/stretchr/testify/assert"
)

func GetUUID() string {
	id := uuid.Must(uuid.NewV4())
	return id.String()
}

func TestAddOrUpdatedScanResult(t *testing.T) {
	scanResult := ScanResult{
		Compliancetype: "A",
	}
	id := GetUUID()
	AddOrUpdatedScanResult(id, scanResult)
	returnedScanResult, _ := GetScanResult(id)
	assert.Equal(t, scanResult.Compliancetype, returnedScanResult.Compliancetype,
		"Compliance types should be same")

	scanResult.Compliancetype = "B"

	returnedScanResult2, _ := GetScanResult(id)
	assert.NotEqual(t, scanResult.Compliancetype, returnedScanResult2.Compliancetype,
		"Compliance types should not be same")

	AddOrUpdatedScanResult(id, scanResult)
	returnedScanResult3, _ := GetScanResult(id)
	assert.Equal(t, scanResult.Compliancetype, returnedScanResult3.Compliancetype,
		"Compliance types should be same")
}

func TestAddOrUpdatedScanResultMultipleAddition(t *testing.T) {
	scanResult := ScanResult{
		Compliancetype: "A",
	}
	id := GetUUID()
	countBefore := len(ScanResultsMap)

	AddOrUpdatedScanResult(id, scanResult)
	AddOrUpdatedScanResult(id, scanResult)
	AddOrUpdatedScanResult(id, scanResult)

	assert.Equal(t, countBefore+1, len(ScanResultsMap), "After adding same value multiple times count should be 1")
}

func TestGetInvalid(t *testing.T) {

	id := GetUUID()
	_, err := GetScanResult(id)
	assert.NotNil(t, err, "Get of not known id should return error")
}

func TestAddOrUpdateResultWithOutScanResult(t *testing.T) {

	id := GetUUID()
	err := AddOrUpdateResult(id, "rule", "result")
	assert.NotNil(t, err, "add result of not known id should return error")
}

func TestAddOrUpdateResult(t *testing.T) {

	scanResult := ScanResult{
		Compliancetype: "A",
		Results:        make(map[string]string),
	}
	id := GetUUID()

	AddOrUpdatedScanResult(id, scanResult)
	rule := "rule"
	result := "result"
	err := AddOrUpdateResult(id, rule, result)
	assert.Nil(t, err, "add result of known id should not return error")

	scanResultRetrived, err1 := GetScanResult(id)
	assert.Nil(t, err1, "get result of known id should not return error")
	assert.Equal(t, 1, len(scanResultRetrived.Results), "scan result retrived len should be 1")

	AddOrUpdateResult(id, rule+"1", result+"1")
	assert.Equal(t, 2, len(scanResultRetrived.Results), "scan result retrived len should be 2")

	resultValue, exists := scanResultRetrived.Results[rule]
	assert.True(t, exists)
	assert.Equal(t, result, resultValue)

	resultValue1, exists1 := scanResultRetrived.Results[rule+"1"]
	assert.True(t, exists1)
	assert.Equal(t, result+"1", resultValue1)

	_, exists2 := scanResultRetrived.Results["dummy"]
	assert.False(t, exists2)
}
