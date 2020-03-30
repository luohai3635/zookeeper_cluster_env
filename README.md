# zookeeper_cluster_env
方便在mac上运行的zookeeper集群搭建环境，同时提供移除zookeeper中的误操作工具（当前仅在本地测试通过，线上环境使用请进行生产级测试）

# 参考
[如何用git命令生成Patch和打Patch][!https://www.cnblogs.com/ArsenalfanInECNU/p/8931377.html]
[zookeeper数据恢复][!https://blog.csdn.net/IAmListening/article/details/95197707]

# 环境
1. zookeeper:3.5.7
2. macOS:10.14.6

# 前期准备工作

## 集群搭建
1. 修改env.sh 中对应的环境变量，将下载的`zookeeper:3.5.7` 解压到相应位置
2. 修改`cluster_conf`中 `zoo.cfg`的相关配置
3. 执行: 
 ```shell
    source ./env.sh
    mkdir formatter_lib
    cp $ZOOKEEPER_HOME/lib/commons-cli-1.2.jar formatter_lib/
    cp $ZOOKEEPER_HOME/lib/log4j-1.2.17.LICENSE.txt formatter_lib/
    cp $ZOOKEEPER_HOME/lib/log4j-1.2.17.jar formatter_lib/
    cp $ZOOKEEPER_HOME/lib/slf4j-1.7.25.LICENSE.txt formatter_lib/
    cp $ZOOKEEPER_HOME/lib/slf4j-api-1.7.25.jar formatter_lib/
    cp $ZOOKEEPER_HOME/lib/slf4j-log4j12-1.7.25.jar formatter_lib/
    cp $ZOOKEEPER_HOME/lib/zookeeper-3.5.7.jar formatter_lib/
    cp $ZOOKEEPER_HOME/lib/zookeeper-jute-3.5.7.jar formatter_lib/
 ```

## 根据补丁生成对应jar包
1. 从[github-zookeeper][!https://github.com/apache/zookeeper] 中下载`3.5.7`的zookeeper源码，本地编译
2. 参考 [如何用git命令生成Patch和打Patch][!https://www.cnblogs.com/ArsenalfanInECNU/p/8931377.html] 将`0001-delete-operation-by-zxids.patch` 补丁打到代码中
3. 将打出的 `zookeeper-3.5.7.jar` 拷贝到 zookeeper 集群中的`formatter_lib`目录下

## 启动集群
1. `start_zookeeper_cluster.sh`

# 测试
1. 预先对zookeeper 做一些增删查改之后，通过`toolkit_formatter.sh`对操作事务日志进行编辑，查看编辑之后的结果
2. 注意，编辑之前需要停掉zookeeper集群，需要将每个节点的事务日志都移除，只保留一个节点的正常事务日志以及修改后的日志文件（文件名需要修改为原来的文件名）重启zookeeper集群

# 重要
1. 谨慎谨慎，在谨慎！！！

# 后续
1. 后续可以考虑对快照日志进行修改