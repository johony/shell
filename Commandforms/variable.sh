#测试变量存在与否,若变量不存在，则传回默认值
${name-'zzl'}

#测试变量不存在或其值为空，传回默认值
${myname:-'zzl'}
#常用的开启debug模式方法
[ -n ${DEBUG:-} ] && set -v
han shu
#测试变量不存在或其值为空，给变量设定一个默认值
${myname:='zzl'}

#测试变量不存在或其值为空，提示错误信息。返回1
${myname:?'提示信息'}

#测试变量存在性
#若变量myname存在，且其值非空，则传回true，否则传回空值
#这里的真值除了空字符串和数字以外的任何字符都可以
${myname:+'true'}
#用法
exec grep -F ${1:+'$@'}


#截取字符串
#由指定位置开始截取字符串
myname="Sheller man"
substr=${myname:4:7}
#结果:ler man，若没有指定截取的长度7，则截取到字符串尾部

#计算字符串长度
${#myname}
#或使用expr length
len=$(expr length ${myname})


#对比样式
#由前面开始，与字符串对比，删除最短符合者
filename=/usr/bin/php
#删除/usr/
${filename#/*/}

#删除最长符合者
#删除/usr/bin/
${filename##/*/}

#由后面开始对，与字符串对比，删除最短符合者
${filename%/*/}

#由后面开始对，与字符串对比，删除最长符合者
${filename%%/*/}


#取代或删除部分字符串
#替换第一个对比符合的字符串
#${变量/样式/替换字符串}
act="mail:x:8:8:mail:/var/mail:/bin/sh"
r=${act/:/,}

#替换全部符合的字符串
#${变量//样式/替换字符串}
r=${act//:/,}

#上述两个变量替换中，不添加替换字符串，即是删除符合样式的子字符串


#获取数组中索引列表
${!arr[@]}
#或
${!arr[*]}
#扩展式中若使用的是@，且出现在双引号中，则传回的不是一个整体字符串，而是将索引试为单独的字符串，如:
for i in "${!arr[@]}"
do
    echo "index : $i : ${arr[$i]}"
done


#获取IP
#! /bin/bash
tmp=$(ifconfig eth0)
r=${tmp/inet addr:/}
ip=${r/ Bcast*/}
echo $ip


#算数式
#方式一：$(())
I=$((8+16))
echo $I

#方式二：$[]
r=$[4+5]

#方式三：declare
declare -i r=8+16

#方式四：let
let r=8+16

#方式五：expr
r=`expr 4+5`
