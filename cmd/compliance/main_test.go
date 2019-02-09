package main

import (
	"compliance/ruleengine"
	"fmt"
	"os"
	"testing"
)

func TestSetScriptPathFromMain(t *testing.T) {
	ruleengine.SetScriptPath()

	if _, err := os.Stat(ruleengine.ScriptPath); os.IsNotExist(err) {
		t.Errorf("Expecting script path to be present in folder %s", ruleengine.ScriptPath)
	} else {
		fmt.Printf("script path is present at %s", ruleengine.ScriptPath)
	}
}
