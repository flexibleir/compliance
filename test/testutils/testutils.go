package testutils

import "github.com/flexibleir/compliance/data/logindetails"

const hostName = "localhost"
const userName = "akshay"
const password = "akshay"

const FlexibleIrEmail string = "ss@fir.com"
const FlexibleIrPassword string = "Hpqvj4vPNbwsdkg"

// Credential - test credentials
var Credential = logindetails.CreateLoginDetails(hostName, userName, password)
