package execution

import "os/exec"

func execute(cmd *string) (string, error) {
	rmcmd1 := exec.Command("sh", "-c", *cmd)
	outByteArr, err := rmcmd1.CombinedOutput()
	if err != nil {
		return "", err
	}
	outputStr := string(outByteArr)
	return outputStr, nil
}
