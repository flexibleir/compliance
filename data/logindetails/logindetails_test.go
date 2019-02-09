package logindetails

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestCreateLoginDetails(t *testing.T) {
	hostName := "dummyHostName"
	userName := "dummyUserName"
	password := "dummyPassword"

	loginDetails := CreateLoginDetails(hostName, userName, password)

	assert.Equal(t, hostName, loginDetails.HostName)
	assert.Equal(t, userName, loginDetails.UserName)
	assert.Equal(t, password, loginDetails.Password)
}
