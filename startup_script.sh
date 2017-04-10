#!/bin/bash

IP=`hostname --ip-address`

# Setup Cassandra 
CONFIG=/etc/cassandra/conf/cassandra.yaml
sed -i -e "s/listen_address: localhost/listen_address: $IP/" $CONFIG
sed -i -e "s/rpc_address: localhost/rpc_address: $IP/"       $CONFIG
sed -i -e "s/- seeds: \"127.0.0.1\"/- seeds: \"$IP\"/"       $CONFIG

service sshd start
service cassandra start

su guest $HOME/kafka/bin/zookeeper-server-start.sh $HOME/kafka/config/zookeeper.properties  > /home/guest/zookeeper.log 2>&1 &
su guest $HOME/kafka/bin/kafka-server-start.sh $HOME/kafka/config/server.properties > /home/guest/kafka.log 2>&1 &

sleep 16
cqlsh -f init_cassandra.cql $IP
