#!/bin/sh
snapshot_file=$1
java -Djava.ext.dirs=formatter_lib org.apache.zookeeper.server.SnapshotFormatter $snapshot_file
