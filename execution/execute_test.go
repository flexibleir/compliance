package execution

import (
	"testing"
)

func TestExecute(t *testing.T) {
	cmd := "date"
	output, err := execute(&cmd)
	if err != nil {
		t.Errorf("Execute failed for command %s with error", cmd)
		t.Error(err)
	} else {
		t.Logf("Test Passed with ouput %s", output)
	}
}

func TestExecuteWrongCommand(t *testing.T) {
	cmd := "wrongCommand"
	_, err := execute(&cmd)
	if err == nil {
		t.Errorf("Execute is expected to fail for cmd %s but did not fail", cmd)
	}
}
