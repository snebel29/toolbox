# toolbox
Toolbox is a docker container image for diagnosis and troubleshooting, its purpose is not to be particularly slim (currently it's around 200MB) but to be handy and confortable even at the expenses of waiting a few more seconds during pulling.

## Usage

Run in terminal interactive mode, mount current directory on `/data` within the docker container instance and join container network namespace
```
$ docker run -it \
	--rm \
	--volume $(pwd):/data \
	--network container:<container-id> \
	snebel29/toolbox 
```

Run tcpdump detached from your terminal session and stores dump in current directory, `/data` within the container instance
```
$ docker run -d \
	--rm \
	--volume $(pwd):/data \
	--network container:<container-id> \
	snebel29/toolbox \
	tcpdump -w /data/mysql.dump port 3306
```

Expose files from a directory through http for stubbing and testing
```
$ DIRECTORY=$(PWD)
$ docker run -it \
	--rm \
	-p 127.0.0.1:6666:6666 \
	--volume ${DIRECTORY}:/data \
	snebel29/toolbox \
	http_server -d /data
```

## Build
Docker will automatically build and publish the new image remotely upon tagging

```
$ VERSION=v1.1.0
$ docker build -t snebel29/toolbox:${VERSION} .
$ git add --all
$ git commit -m "My change"
$ git tag ${VERSION}
$ git push origin master
```
