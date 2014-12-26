Docker image with DB2 Express
============================
This repo contains a docker image build file that includes Ubuntu with DB2 10.5 Express-C (Free version) installed. 
It is aimed at running on Dev machines to try to mirror production as much as possible without licensing implications.

You will still need to create an Instance, Database and User.

A lot of credit should got to Bryan Tsai as his repo
https://github.com/bryantsai/db2-docker allowed me to learn how to setup/install DB2 within a Docker container.

* To build this image use `./build.sh`

If you don't want to build it and just want to use this image you can download this Image from: `https://registry.hub.docker.com/u/grange74/db2/`



