package testutils

import "compliance/data/logindetails"

const hostName = "localhost"
const userName = "akshay"
const password = "akshay"

// Credential - test credentials
var Credential = logindetails.CreateLoginDetails(hostName, userName, password)
