#! /bin/bash

#/usr/sbin/init

help() {
    echo "
脚本将GlusterFS服务器的创建简化为了几个变量的配置：

*  -h 或 --help ：显示帮助
*  --start ：自定义的服务器启动脚本路径，默认值为 /usr/sbin/init 

下面这个↓将会被放入 gluster peer probe <地址或域名> 命令中，可以有多个

*  -p 或 --peer ：要加入信任池的服务器地址或域名

下面这些↓将会放入 gluster volume create ... 命令中，可以有多个，按顺序组合，每个都以 -v 或 --volume 打头。创建指南见官方教程

*  -v 或 --volume ：要创建的虚拟盘名称，只能有一个
*  --replica ：要创建的冗余卷数量，只能有一个
*  --stripe ：要创建的条带卷数量，只能有一个
*  --disperse ：要创建的纠错码卷数量，只能有一个
*  -t或--transport：要创建的卷通信方法
*  -s 或 --server ：要创建虚拟卷的服务器地址和目录，可以有多个，但是其数量必须与冗余卷、条带卷、纠错码卷三者数量之和相等
*  -f 或 --force ：是否用force创建
"
}

probe_server() {
    echo "gluster peer probe $1"
}

create_volume() {
    VOLUME_PARS=$1
    VOLUME_SERVERS=$2
    cmd=""
    if [ ${VOLUME_PARS[0]} != 0 ]; then
        cmd="${cmd} gluster volume create ${VOLUME_PARS[0]}"
    else
        return 1
    fi
    if [ ${VOLUME_PARS[1]} != 0 ]; then
        cmd="${cmd} replica ${VOLUME_PARS[1]}"
    fi
    if [ ${VOLUME_PARS[2]} != 0 ]; then
        cmd="${cmd} stripe ${VOLUME_PARS[2]}"
    fi
    if [ ${VOLUME_PARS[3]} != 0 ]; then
        cmd="${cmd} disperse ${VOLUME_PARS[3]}"
    fi
    if [ ${VOLUME_PARS[4]} != 0 ]; then
        cmd="${cmd} transport ${VOLUME_PARS[4]}"
    fi
    for VOLUME_SERVER in ${VOLUME_SERVERS[*]}; do
        cmd="${cmd} ${VOLUME_SERVER}"
    done
    echo "$cmd"
    return 0
}

ARGS=$(getopt -o p:v:t:s:fh -l start:,peer:,volume:,replica:,stripe:,disperse:,transport:,server:,force,help -- "$@")

# check arguments, exit on fail
if [ $? != 0 ]; then
    help
    exit $?
fi

#将规范化后的命令行参数分配至位置参数（$1,$2,...)
eval set -- "${ARGS}"
echo ARGS detected : $*

START_SCRIPT="/usr/sbin/init"
PROBE_SERVERS=()
VOLUME_PARS=(0 0 0 0 0 0)
VOLUME_SERVERS=()
CREATE_VOLUMES=()

# parse arguments
while true; do
    case "$1" in
    -h | --help)
        help
        exit 0
        ;;
    --start)
        START_SCRIPT=$2
        shift 2
        ;;
    -p | --peer)
        PROBE_SERVERS[${#PROBE_SERVERS[*]}]=$(probe_server $2)
        shift 2
        ;;
    -v | --volume)
        CREATE_VOLUME=$(create_volume $VOLUME_PARS $VOLUME_SERVERS)
        if [ $? == 0 ]; then
            CREATE_VOLUMES[${#CREATE_VOLUMES[*]}]=$CREATE_VOLUME
        fi
        VOLUME_PARS[0]=$2
        shift 2
        ;;
    --replica)
        VOLUME_PARS[1]=$2
        shift 2
        ;;
    --stripe)
        VOLUME_PARS[2]=$2
        shift 2
        ;;
    --disperse)
        VOLUME_PARS[3]=$2
        shift 2
        ;;
    -t | --transport)
        VOLUME_PARS[4]=$2
        shift 2
        ;;
    -s | --server)
        VOLUME_SERVERS[${#VOLUME_SERVERS[*]}]=$2
        shift 2
        ;;
    -f | --force)
        VOLUME_PARS[5]=1
        shift 1
        ;;
    --)
        shift
        break
        ;;
    *)
        echo help
        exit 1
        ;;
    esac
done
CREATE_VOLUMES[${#CREATE_VOLUMES[*]}]=$(create_volume $VOLUME_PARS $VOLUME_SERVERS)

echo $START_SCRIPT

echo "Waiting for other server to start."
for i in '9876543210'; do
    echo $if
    sleep 1s
done

for i in "${!PROBE_SERVERS[@]}"; do
    echo ${PROBE_SERVERS[$i]}
    ${PROBE_SERVERS[$i]}
done

for i in "${!CREATE_VOLUMES[@]}"; do
    echo ${CREATE_VOLUMES[$i]}
    ${CREATE_VOLUMES[$i]}
done

exit 0
