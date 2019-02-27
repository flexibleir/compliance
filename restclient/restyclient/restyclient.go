package restyclient

import "gopkg.in/resty.v1"

func Get(url string, token string) (int, string, error) {
	resp, err := resty.R().
		SetHeader("Accept", "application/json").
		SetHeader("Content-Type", "application/json").
		SetAuthToken(token).
		Get(url)
	body := string(resp.Body())
	statusCode := resp.StatusCode()
	return statusCode, body, err
}

func Post(url string, token string, body string) (int, []byte, error) {
	resp, err := resty.R().
		SetHeader("Content-Type", "application/json").
		SetHeader("Accept", "application/json").
		SetHeader("Authorization", token).
		// SetAuthToken(token).
		SetBody(body).
		Post(url)
	statusCode := resp.StatusCode()
	return statusCode, resp.Body(), err
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
