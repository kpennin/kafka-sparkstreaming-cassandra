#!/bin/bash
sudo docker run -p 9042:9042 -p 4040:4040 -p 8888:8888 -p 23:22 -ti --privileged kafka-sparkstreaming-cassandra

