
Post:
curl -d '{"hostname": "172.18.0.2","id": "30","username":"akshay","password":"akshay"}' -H "Content-Type: application/json" -X POST http://172.18.0.1:8080

Get:
curl -H "Content-Type: application/json" -X GET http://172.18.0.2:8080/30

