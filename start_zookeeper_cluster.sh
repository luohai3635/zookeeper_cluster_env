#!/bin/sh

source ./env.sh
sh $ZOOKEEPER_HOME/bin/zkServer.sh --config $ZOOKEEPER_CLUSTER_HOME/cluster_conf/zoo1 start
sh $ZOOKEEPER_HOME/bin/zkServer.sh --config $ZOOKEEPER_CLUSTER_HOME/cluster_conf/zoo2 start
sh $ZOOKEEPER_HOME/bin/zkServer.sh --config $ZOOKEEPER_CLUSTER_HOME/cluster_conf/zoo3 start
