# [cav94mat/rpi-virtualhere](https://hub.docker.com/r/cav94mat/rpi-virtualhere/)
VirtualHere server image for Raspberry Pi. 

---
VirtualHere is downloaded automatically whenever the container is started for the first time. To upgrade it to the latest version, just `rm` and re-`run` it like this:

```
docker run -d --restart=unless-stopped -v /opt/virtualhere/conf:/conf -p 7575:7575 --privileged --name virtualhere cav94mat/rpi-virtualhere:latest
```

> **Warning**: `--privileged` access is required for USB access within the container. If better solutions are found, please leave a comment below.
