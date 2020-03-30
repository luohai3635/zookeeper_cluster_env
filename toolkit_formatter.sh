#!/bin/sh
deletezxids=$1
filename=$2
java -Djava.ext.dirs=formatter_lib org.apache.zookeeper.server.persistence.TxnLogToolkit -drv  -s $1 $2
