# Dockerfile for building RclDotnet binary for Unity
## Requirement
This binary only test on Ubuntu 18.04 and Unity 2020

## How to use
1. install docker
2. build docker image and run 
```
sh build.sh
```
3. copy files from docker container using docker cp link
```
docker cp <container_id>:/UnityRclDotnet UnityRclDotnet
```