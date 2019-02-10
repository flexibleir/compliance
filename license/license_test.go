package main

import (
	"fmt"
	"testing"
)

func TestHashP1(t *testing.T) {

	teststr := "?version=02-01-2019&type=cp&sdst=02/10/2019&seet=03/09/2019"
	actualHash := createHash(teststr)

	expectedHash := "94d5c715775ba21f5125072dbc44e54d6a89aab86aef346a00fc19f82466841396648cd1dd4b4f7bbd64135c3bc4bc9618d1cff2ee0c435e415567f7a6c4b9c4"

	if actualHash == expectedHash {
		fmt.Println("Hash created is correct")
	} else {
		t.Errorf("Expected hash is %s and actual hash is %s", expectedHash, actualHash)
	}
}

func TestHashN1(t *testing.T) {

	teststr := "?version=02-01-2019&type=cp&sdst=02/10/2019&seet=03/09/2019"
	actualHash := createHash(teststr)

	expectedHash := "94d5c715775ba21f5125072dbc44e54d6a89aab86aef346a00fc19f82466841396648cd1dd4b4f7bbd64135c3bc4bc9618d1cff2ee0c435e415567f7a6c4b9c4"

	if actualHash != expectedHash {
		t.Errorf("Created Hash should not not match")
	} else {
		fmt.Println("Hash created is not be correct as expected")
	}
}
