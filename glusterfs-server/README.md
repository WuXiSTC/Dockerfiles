# glusterfs-server

The server image for GlusterFS.

此镜像用于创建GlusterFS服务器。主要内容在start.sh里面。其功能是：

1. 启动一个服务器
2. 将指定的几个服务器加入信任池
3. (Optional)创建一个虚拟盘

## 使用方法

本镜像使用一个`start.sh`脚本将GlusterFS服务器的创建简化为了几个变量的配置：

* `-h`或`--help`：显示帮助
* `-s`或`--start`：自定义的服务器启动脚本路径，默认值为`/usr/sbin/init`

下面这个👇将会被放入`gluster peer probe <地址或域名>`命令中，可以有多个

* `-p`或`--peer`：要加入信任池的服务器地址或域名

下面这些👇将会放入`gluster volume create ...`命令中，可以有多个，按顺序组合，每个都以`-v`或`--volume`打头。创建指南见[官方教程](https://docs.gluster.org/en/latest/Administrator%20Guide/Setting%20Up%20Volumes/)

* `-v`或`--volume`：要创建的虚拟盘名称，只能有一个
* `--replica`：要创建的冗余卷数量，只能有一个
* `--stripe`：要创建的条带卷数量，只能有一个
* `--disperse`：要创建的纠错码卷数量，只能有一个
* `-t`或`--transport`：要创建的卷通信方法
* `-s`或`--server`：要创建虚拟卷的服务器地址和目录，可以有多个，但是其数量必须与冗余卷、条带卷、纠错码卷三者数量之和相等
* `-f`或`--force`：是否用force创建

### 启动

```sh
docker run -v [挂载磁盘] -p [端口映射] yindaheng98/glusterfs-server start.sh [命令行参数]
```

具体磁盘挂载和端口映射规则见[官方镜像库](https://hub.docker.com/r/gluster/glusterfs-client)。
