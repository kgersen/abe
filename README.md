### Android source - development environment

from: http://source.android.com/source/initializing.html

* openjdk-7
* toolchain

#### Install

You can either pull from `kgersen/abe`:
```
docker pull kgersen/abe
```
```
docker run -it -v /path_to_source:/path_to_source kgersen/abe /bin/bash
```
or add it to your Dockerfile:
```
FROM kgersen/abe
```
#### Intructions to build NVidia Shield Android TV kernel

1. create a folder for the source code on your host, for instance:

 `/home/user/shield-open-source`

2. fetch the instruction page at: https://developer.nvidia.com/shield-open-source (you should end up seeing a text page starting with "Welcome to the SHIELD Open Source + Binary Driver Release"). note the 'repo init -u ...' line

3. launch a  container

 `docker run -it -v /home/user/shield-open-source:/root/shield-open-source kgersen/abe /bin/bash`

 `cd /root/shield-open-source`

 `repo init -u git:.... (same line noted above)`

 `repo sync -j5`

 This will fetch the source code. This can take a very long time. The code will be downloaded in `/root/shield-open-source` inside the container which is `/home/user/shield-open-source` on your host (or whatever folder you used in the step 1)

4. from there you're set up to build. Do the changes on the source code you want from within your host then follow the "HowTo Build" instructions, inside the container, from the instruction page at NVidia (see step 2).
