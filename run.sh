#!/bin/bash
cd `dirname $0`

docker run -d --gpus all \
-v $PWD/code/:/opt/code/ \
--shm-size=16G \
--rm -p 8891:8888 \
--name test-minimind \
172.20.20.187/test-minimind:0.0.1
