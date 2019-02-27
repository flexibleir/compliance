package flexibleirclient

import (
	"fmt"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestLoginNegative(t *testing.T) {
	statuscode, body, err := Login("abc@xyz", "123456")
	assert.Equal(t, 200, statuscode)
	assert.Equal(t, "", body)
	assert.Equal(t, nil, err)
}

func TestLoginPositive(t *testing.T) {
	statuscode, body, err := Login("ss@fir.com", "Hpqvj4vPNbwsdkg")
	fmt.Println(body)
	assert.Equal(t, 200, statuscode)
	assert.Equal(t, "", body)
	assert.Equal(t, nil, err)
}
