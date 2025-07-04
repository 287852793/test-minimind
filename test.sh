#!/bin/bash
cd `dirname $0`

docker run --rm --gpus all \
-v $PWD/code/:/opt/code/ \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /usr/bin/docker:/usr/bin/docker \
--shm-size=16G \
--rm -p 8891:8888 \
--name test-minimind \
--entrypoint /bin/bash \
-it 172.20.20.187/test-minimind:0.0.1

