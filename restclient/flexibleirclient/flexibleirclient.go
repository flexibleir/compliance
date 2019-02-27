package flexibleirclient

import "encoding/json"
import "compliance/restclient/restyclient"

const Bearer = "Bearer"
const BaseUrl = "http://flexibleir.com/api/v1/"
const LoginUrl = BaseUrl + "login"

type loginDetails struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

func Login(userName string, password string) (int, string, error) {
	login := &loginDetails{
		Email:    userName,
		Password: password,
	}
	byteArray, _ := json.Marshal(login)
	jsonRequest := string(byteArray)

	return restyclient.Post(LoginUrl, "", jsonRequest)
}
