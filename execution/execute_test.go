package execution

import (
	"testing"
)

const hostName = "localhost"
const userName = "akshay"
const password = "akshay"

func TestExecute(t *testing.T) {
	cmd := "date"
	output, err := Execute(cmd)
	if err != nil {
		t.Errorf("Execute failed for command %s with error", cmd)
		t.Error(err)
	} else {
		t.Logf("Test Passed with ouput %s", output)
	}
}

func TestExecuteWrongCommand(t *testing.T) {
	cmd := "wrongCommand"
	_, err := Execute(cmd)
	if err == nil {
		t.Errorf("Execute is expected to fail for cmd %s but did not fail", cmd)
	}
}

func TestExecuteRemoteSystem(t *testing.T) {
	scriptPath := ".././scripts/cis/mini/disable_freevxfs.sh"
	output, err := ExecuteScriptRemote(scriptPath, hostName, userName, password)
	if err != nil {
		t.Errorf("Execute failed for command %s with error", scriptPath)
		t.Error(err)
	} else {
		t.Logf("Test Passed with ouput %s", output)
	}
}

func TestExecuteRemoteWrongCommand(t *testing.T) {
	cmd := "wrongCommand"
	_, err := ExecuteScriptRemote(cmd, hostName, userName, password)
	if err == nil {
		t.Errorf("Execute is expected to fail for cmd %s but did not fail", cmd)
	}
}
