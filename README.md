# Apache Log4j cve example repo and docker images

This repository holds code to reproduce the [Log4j cve](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-44228) 

## Reproduce the vulnerability
You need to run a docker image that will safely fetch and run the vulnerable code without you having to install java or any java dependencies
```
❯ make run
docker build -t log4jcve .
[+] Building 0.6s (9/9) FINISHED
 => [internal] load build definition from Dockerfile                                                             0.0s
 => => transferring dockerfile: 497B                                                                             0.0s
 => [internal] load .dockerignore                                                                                0.0s
 => => transferring context: 2B                                                                                  0.0s
 => [internal] load metadata for docker.io/library/maven:3.8.4-jdk-8                                             0.5s
 => [1/4] FROM docker.io/library/maven:3.8.4-jdk-8@sha256:1d4f75adc85edeb0f5748eebe2cecacd4f9e7ee8ad324c82e24d3  0.0s
 => [internal] load build context                                                                                0.0s
 => => transferring context: 5.92kB                                                                              0.0s
 => CACHED [2/4] COPY . /usr/src/poc                                                                             0.0s
 => CACHED [3/4] WORKDIR /usr/src/poc                                                                            0.0s
 => CACHED [4/4] RUN mvn clean && mvn package                                                                    0.0s
 => exporting to image                                                                                           0.0s
 => => exporting layers                                                                                          0.0s
 => => writing image sha256:6e78e7f4421e39694390882e81f8871a4a28df815b1c7765e9da30ceea63c68e                     0.0s
 => => naming to docker.io/library/log4jcve                                                                      0.0s
docker run -ti log4jcve
17:22:20.369 [main] ERROR MyExample - if you can read this this code is vulnerable
```
The code above is using log4j `2.14.1` which is vulnerable.

There is an image [justinjustin/poc](https://hub.docker.com/r/justinjustin/poc) that you can get from Docker Hub which holds the code of this repository.

## Working around the vulnerability
With this repo you can play with possible workarounds and fixes, notably by moving to `2.15.0` of log4j, you can do this in the [pom.xml](pom.xml#L18) or you can experiment with the `LOG4J_FORMAT_MSG_NO_LOOKUPS=true` environment variable that you can test in the included [Dockerfile](Dockerfile#L8)

Code modified from Packet Storm
https://packetstormsecurity.com/files/download/165225/apache-log4j-poc-main.zip

