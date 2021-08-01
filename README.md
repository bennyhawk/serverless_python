# Serverless Python container 

***[Serverless framework](https://www.serverless.com/) + Python 3.8 in a container***

This repository was created to satisfy the need for a stable Serverless framework environment to package Python lambdas. 

# How to use

Simply pull this container and run. You will be able to run the `sls package` function that uses the bundled Python 3.8 to generate the zip for the lambda 

* For CMD

```bash
docker pull ghcr.io/bennyhawk/serverless_python:main
docker run -it serverless_python
sls package
```

* For Jenkins

```bash
withDockerContainer("ghcr.io/bennyhawk/serverless_python:main") { sh "sls deploy"}
````


