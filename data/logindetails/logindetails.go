package logindetails

// LoginDetails - Login details
type LoginDetails struct {
	HostName string
	UserName string
	Password string
}

// CreateLoginDetails - Creates login details.
func CreateLoginDetails(hostName string, userName string, password string) *LoginDetails {
	loginDetails := LoginDetails{
		HostName: hostName,
		UserName: userName,
		Password: password,
	}
	return &loginDetails
}
