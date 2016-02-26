### Android source - development environment

from: http://source.android.com/source/initializing.html
and: http://source.android.com/source/downloading.html#installing-repo

* openjdk-7
* toolchain
* repo

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
#### Intructions to build for the NVidia Shield Android TV 

1. create a folder for the source code on your host, for instance:

 `mkdir /home/user/shield-open-source`

2. fetch the instruction page at: https://developer.nvidia.com/shield-open-source (you should end up seeing a text page starting with "Welcome to the SHIELD Open Source + Binary Driver Release"). note the 'repo init -u ...' line

3. launch a  container

 `docker run -it --rm --name abe -v /home/user/shield-open-source:/root/shield-open-source kgersen/abe /bin/bash`

 `cd /root/shield-open-source`

 `repo init -u git:.... (same line as noted in step 2)`

 `repo sync -j5`

 This will fetch the source code. This can take a very long time. The code will be downloaded in the `/root/shield-open-source` folder inside the container which is the `/home/user/shield-open-source` folder on your host (or whatever folder you used in the step 1)

4. from there you're set up to build. Do the changes on the source code you want from within your host then follow the "HowTo Build" instructions, inside the container, from the instruction page at NVidia (see step 2). If you quit the command line (exit) from the container it will be destroyed (because of the --rm flag). Just recreate a new one with the same command as in step 3. You can use `ctrl-p + ctrl-q` to detach from it without killing it. Then use `docker attach abe` to reconnect to it.

If you want to build only the kernel or use a build cache, follow the instructions here: https://bitbucket.org/nopnop9090/shieldtv-kernel/wiki/Home (map the .cache folder a host folder or the cache will be destroyed when the container ends)
