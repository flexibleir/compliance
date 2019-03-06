package scanresultsmap

import (
	"github.com/flexibleir/compliance/constants/compliancetype"
	"github.com/flexibleir/compliance/constants/scanstatus"
	"errors"
)

// ScanResult - Scan Result
type ScanResult struct {
	HostName       string
	ComplianceType compliancetype.ComplianceType
	Results        map[string]string
	TotalRules     int
	ScanStatus     scanstatus.ScanStatus
	ErrorMessage   string
	BoardURL       string
}

// ScanResultsMap - Scan Result Map
var ScanResultsMap = make(map[string]*ScanResult)

// AddOrUpdatedScanResult - Add or Update scan result
func AddOrUpdatedScanResult(id string, scanResult ScanResult) ScanResult {
	ScanResultsMap[id] = &scanResult
	retrivedScanResult := ScanResultsMap[id]
	return *retrivedScanResult
}

// GetScanResult - Gets the scan result
func GetScanResult(id string) (ScanResult, error) {
	var dummy ScanResult
	value, exists := ScanResultsMap[id]
	if !exists {
		return dummy, errors.New("Id Not Fount")
	}
	return *value, nil
}

// AddOrUpdateResult - Adds Result.
func AddOrUpdateResult(id string, rule string, result string) error {
	scanResult, exists := ScanResultsMap[id]
	if !exists {
		return errors.New("No Scan Result founf for this Id")
	}

	scanResult.Results[rule] = result
	return nil
}
