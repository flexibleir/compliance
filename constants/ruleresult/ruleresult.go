package ruleresult

// RuleResult - Scan Status
type RuleResult int32

// Compliance types
const (
	Passed RuleResult = 0
	Failed RuleResult = 1
	Error  RuleResult = 2
)
