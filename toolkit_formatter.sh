#!/bin/sh
operatation=$*
java -Djava.ext.dirs=formatter_lib org.apache.zookeeper.server.persistence.TxnLogToolkit $operatation
