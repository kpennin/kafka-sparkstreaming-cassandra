docker run -v \`pwd\`:/home/guest/host -p 4040:4040 -p 8888:8888 -p 23:22 -p 9042:9042 -p 9160:9160 -ti --privileged kafka-sparkstreaming-cassandra
