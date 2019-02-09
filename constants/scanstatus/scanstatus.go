package scanstatus

// ScanStatus - Scan Status
type ScanStatus int32

// Compliance types
const (
	InProgress ScanStatus = 0
	Completed  ScanStatus = 1
	TimedOut   ScanStatus = 2
	Failed     ScanStatus = 3
)
