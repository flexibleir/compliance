package main

import (
	"crypto/sha512"
	"flag"
	"fmt"
	"time"
)

func createHash(constring string) (signstr string) {

	newsign := sha512.New()
	newsign.Write([]byte(constring))
	sign := fmt.Sprintf("%x", newsign.Sum(nil))

	return sign
}

func main() {

	var startDate string
	var endDate string
	var selectedServices string

	currentDate := time.Now()
	defaultStartDate := currentDate.Format("01-02-2006T03:04:05")
	defaultEndDate := currentDate.AddDate(0, 1, 0).Format("01-02-2006T03:04:05")

	flag.StringVar(&startDate, "startDate", defaultStartDate, "a string var")
	flag.StringVar(&endDate, "endDate", defaultEndDate, "a string var")
	flag.StringVar(&selectedServices, "selectedServices", "cp", "a string var")

	flag.Parse()

	result := fmt.Sprintf("?version=02-01-2019&type=%s&sdst=%s&seet=%s", selectedServices, startDate, endDate)

	sign := createHash(result)

	licence := fmt.Sprintf("%s&sign=%s", result, sign)

	println(licence)
}
