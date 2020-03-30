#!/bin/sh
log_file=$1
java -Djava.ext.dirs=formatter_lib org.apache.zookeeper.server.LogFormatter $log_file
