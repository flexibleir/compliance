package flexibleirclient

import (
	"compliance/restclient/restyclient"
	"encoding/json"
	"fmt"
)

const Bearer = "Bearer"
const BaseUrl = "http://flexibleir.com/api/v1/"
const LoginUrl = BaseUrl + "login"
const CreateIncidentUrl = BaseUrl + "createIncidence"

type Base interface{}

type loginDetails struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

type CreateIncidentDetails struct {
	Description       string `json:"description"`
	UserID            int    `json:"user_id"`
	ReportedBy        string `json:"reported_by"`
	ReportedByEmail   string `json:"reported_by_email"`
	ReportedByContact string `json:"reported_by_contact_number"`
	APICall           bool   `json:"api_call"`
	Severity          string `json:"severity"`
	Businessline      string `json:"businessline"`
	Category          string `json:"category"`
}

type FlexibleIrLoginResponse struct {
	Success  bool          `json:"success"`
	Response LoginResponse `json:"response"`
}

type FlexibleIrCreateResponse struct {
	Success           bool   `json:"success"`
	Message           string `json:"response"`
	BoardSerialNumber int    `json:"data"`
	BoardID           string `json:"board_id"`
}

type LoginResponse struct {
	Email    string `json:"email"`
	Token    string `json:"token"`
	UserName string `json:"user_name"`
}

func Login(userName string, password string) (int, *FlexibleIrLoginResponse, error) {
	login := &loginDetails{
		Email:    userName,
		Password: password,
	}
	byteArray, _ := json.Marshal(login)
	jsonRequest := string(byteArray)
	response := &FlexibleIrLoginResponse{}
	status, body, err := restyclient.Post(LoginUrl, "", jsonRequest)
	json.Unmarshal(body, response)
	return status, response, err
}

func CreateIncident(token string, request *CreateIncidentDetails) (int, *FlexibleIrCreateResponse, error) {
	token = Bearer + " " + token
	byteArray, _ := json.Marshal(request)
	jsonRequest := string(byteArray)
	fmt.Println(jsonRequest)
	status, body, err := restyclient.Post(CreateIncidentUrl, token, jsonRequest)
	response := &FlexibleIrCreateResponse{}
	json.Unmarshal(body, response)
	output := string(body)
	fmt.Println(output)
	return status, response, err
}
