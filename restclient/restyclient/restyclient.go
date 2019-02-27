package restyclient

import "gopkg.in/resty.v1"

func Get(url string, token string) (int, string, error) {
	resp, err := resty.R().
		SetHeader("Accept", "application/json").
		SetAuthToken(token).
		Get(url)
	body := string(resp.Body())
	statusCode := resp.StatusCode()
	return statusCode, body, err
}

func Post(url string, token string, body string) (int, string, error) {
	resp, err := resty.R().
		SetHeader("Accept", "text/html,application/xhtml+xml,application/xml,application/json").
		SetHeader("Accept-Encoding", "gzip, deflate, br").
		SetHeader("Upgrade-Insecure-Requests", "1").
		SetAuthToken(token).
		SetBody(body).
		Post(url)
	responseBody := string(resp.Body())
	statusCode := resp.StatusCode()
	return statusCode, responseBody, err
}

func Put(url string) (string, error) {
	return "", nil
}

func Patch(url string) (string, error) {
	return "", nil
}

func Delete(url string) (string, error) {
	return "", nil
}
