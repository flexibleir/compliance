[swagger]: https://github.com/flexibleir/compliance/blob/master/swagger/swagger.yml

# compliance

This Image is used for compliance scans on the target system.

## Usage
- [Create compliance container](#create-compliance-container)

- [Create target container(optional)](#create-target-containeroptional)

## Create compliance container
Run below commands which will download and create a compliance container with the container name **compliance**.
```
docker run -it --name compliance flexibleir/compliance:0.4 /main
```

compliance container will expose **REST Endpoint** with [Swagger][swagger] specification for management operation.

## Get compliance container's ip
Open the terminal and run below command 
```
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' compliance
```

### Sample curl's Requests 
#### Create a Scan
```
curl -d '{"hostname": "<Target host name or IP>","id": "<any random id ex - 25>","username":"<Password of the host>","password":"akshay","compliancetype":"CiS"}' -H "Content-Type: application/json" -X POST http://<compliance container's ip>:8080
```
Supported compliancetypes
1. CiS
2. PcI

Sample Request
```
curl -d '{"hostname": "172.17.0.2","id": "30","username":"akshay","password":"akshay","compliancetype":"CiS"}' -H "Content-Type: application/json" -X POST http://172.17.0.2:8080
```

#### Get Output of Scan

```
curl -H "Content-Type: application/json" -X GET http://<compliance container's ip>:8080/<Id which will be used in above command>
```
Sample Request
```
curl -H "Content-Type: application/json" -X GET http://172.17.0.2:8080/30
```
Sample Response
```
{
   "compliancetype":"CiS",
   "hostname":"172.18.0.2",
   "id":"30",
   "progress":100,
   "result":[
      {
         "result":"Warning: Permanently added '172.18.0.2' (ECDSA) to the list of known hosts.\r\nFailed",
         "rulename":"disable_freevxfs.sh"
      },
      {
         "result":"Passed",
         "rulename":"ensure_users_dot_files_are_not_group_or_world_writable.sh"
      },
      {
         "result":"Passed",
         "rulename":"ensure_users_own_their_home_directories.sh"
      }
   ],
   "scanstatus":"Completed"
}
```

## Create target container(optional)
If it is hard to get the target machine to get in the network then you can use below commands to create an target system.

```
docker run -it --privileged --name target flexibleir/ubuntu-ssh:0.1 /bin/bash
service ssh restart
useradd --create-home --shell /bin/bash --groups sudo <User name to be added for this container>
passwd <User name to be added for this container>
```
### Above commands performs below steps
1. Creates a container.
2. Restarts **ssh service** in that container.
3. Adds user to the container.
4. Prompts for the password which will be used for that user.