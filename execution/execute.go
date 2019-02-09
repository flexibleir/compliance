package execution

import (
	"fmt"
	"os/exec"
)

// Execute - executes command.
func Execute(cmd string) (string, error) {
	rmcmd1 := exec.Command("sh", "-c", cmd)
	outByteArr, err := rmcmd1.CombinedOutput()
	if err != nil {
		return "", err
	}
	outputStr := string(outByteArr)
	return outputStr, nil
}

// ExecuteScriptRemote - executes command to a remove system using sshpass
func ExecuteScriptRemote(scriptPath string, hostName string, userName string, password string) (string, error) {
	remoteCommand := fmt.Sprintf("sshpass -p %s ssh -o StrictHostKeyChecking=no %s@%s \"bash -s\" < %s", password, userName, hostName, scriptPath)
	fmt.Print(remoteCommand)
	rmcmd1 := exec.Command("sh", "-c", remoteCommand)
	outByteArr, err := rmcmd1.CombinedOutput()
	if err != nil {
		return "", err
	}
	outputStr := string(outByteArr)
	return outputStr, nil
}
