BASH    #bash的完整路径名。
echo $BASH

BASH_ENV    #仅在非互动模式中使用，在执行shell脚本时，会先检查BASH_ENV是否有指定启动文件，若有，则先执行它

CDPATH    #cd命令的搜索路径
export CDPATH="/tmp/B/C:/var/log":$HOME
mkdir -p /tmp/B/C/A
cd A

ENV    #以互动模式调用sh时，会先检查$ENV是否有指定启动文件，若有，则先执行它

FUNCNAME    #在shell脚本执行时，此函数即为当前执行的函数名
function show_name() {
    echo $FUNCNAME
}

GROUPS    #一个数组变量，包含用户所属的组群列表
echo ${GROUPS[0]}

HOSTNAME    #主机名

HOSTTYPE    #主机形态 如：x86_64

IFS    #定义字段分隔符。默认值为：空格符、tab字符、换行符
PL="root:x:0:0:root:/root:/bin/bash"
IFS=":"
for i in $IFS
do
    echo $i
done

LANG    #当前语系(local)的名称