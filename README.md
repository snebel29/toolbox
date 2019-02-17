# toolbox
Toolbox is a docker container image for diagnosis and troubleshooting, its purpose is not to be particularly slim (currently it's around 200MB) but to be handy and confortable even at the expenses of waiting a few more seconds during pulling.

# Usage

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
