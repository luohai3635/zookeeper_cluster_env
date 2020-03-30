#!/bin/sh

source ./env.sh

sh $ZOOKEEPER_HOME/bin/zkServer.sh --config $ZOOKEEPER_HOME/cluster_conf/zoo1 status
sh $ZOOKEEPER_HOME/bin/zkServer.sh --config $ZOOKEEPER_HOME/cluster_conf/zoo2 status
sh $ZOOKEEPER_HOME/bin/zkServer.sh --config $ZOOKEEPER_HOME/cluster_conf/zoo3 status
