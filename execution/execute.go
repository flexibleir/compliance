package execution

import (
	"github.com/flexibleir/compliance/data/logindetails"
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
func ExecuteScriptRemote(scriptPath string, login *logindetails.LoginDetails) (string, error) {
	remoteCommand := fmt.Sprintf("sshpass -p %s ssh -o StrictHostKeyChecking=no %s@%s \"bash -s\" < %s", login.Password, login.UserName, login.HostName, scriptPath)
	fmt.Println(remoteCommand)
	rmcmd1 := exec.Command("sh", "-c", remoteCommand)
	outByteArr, err := rmcmd1.CombinedOutput()
	if err != nil {
		return "", err
	}
	outputStr := string(outByteArr)
	return outputStr, nil
}

// CopyFile - copies file to remote system
func CopyFile(sourcePath string, destinationPath string, login *logindetails.LoginDetails) (string, error) {
	remoteCommand := fmt.Sprintf("sshpass -p %s scp -o StrictHostKeyChecking=no %s %s@%s:%s", login.Password, sourcePath, login.UserName, login.HostName, destinationPath)
	fmt.Println(remoteCommand)
	rmcmd1 := exec.Command("sh", "-c", remoteCommand)
	outByteArr, err := rmcmd1.CombinedOutput()
	if err != nil {
		return "", err
	}
	outputStr := string(outByteArr)
	return outputStr, nil
}
