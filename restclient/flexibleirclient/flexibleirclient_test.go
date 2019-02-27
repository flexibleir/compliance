package flexibleirclient

import (
	"compliance/test/testutils"
	"fmt"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestLoginNegative(t *testing.T) {
	statuscode, body, err := Login("abc@xyz", "123456")
	assert.Equal(t, 200, statuscode)
	assert.Equal(t, nil, err)

	assert.False(t, body.Success)
	assert.Equal(t, "", body.Response.Token)
}

func TestLoginPositive(t *testing.T) {
	statuscode, body, err := Login(testutils.FlexibleIrEmail, testutils.FlexibleIrPassword)
	fmt.Println(body)
	assert.Equal(t, 200, statuscode)
	assert.Equal(t, nil, err)

	assert.True(t, body.Success)
	assert.NotEqual(t, "", body.Response.Token)
}

func TestCreateIncidentPositive(t *testing.T) {
	_, body, _ := Login(testutils.FlexibleIrEmail, testutils.FlexibleIrPassword)
	token := body.Response.Token
	fmt.Println(token)

	request := &CreateIncidentDetails{
		Description:       "CIS:Scan ID:12 ",
		ReportedBy:        "By Docker Container",
		ReportedByEmail:   "docker@flexibleir.com",
		ReportedByContact: "123456789",
		APICall:           true,
		Severity:          "HIGH",
		Businessline:      "",
		Category:          "TemplateKanban",
	}
	_, response, _ := CreateIncident(token, request)
	assert.True(t, response.Success)
}
