# 在shell脚本中可以使用/bin/bash或/bin/sh
# /bin/sh是一个指向/bin/bash的软链接
# 不过，若使用/bin/sh，bash读取启动配置文件的方式，将和旧版的Boune Shell相同，
# 此时bash的功能将尽量和POSIX标准兼容。
#!/bin/bash
#!/bin/sh

#!/usr/bin/env php
# 脚本解释器可能安装在系统中的不同位置上，使用env可以在系统的PATH目录中查找啊。同时，env还规定一些系统环境变量。
# 可通过在终端中直接输出env查看。
# 可直接通过env执行程序，如：
env php


# 使用Bash test.sh或sh test.sh方式执行shell脚本与给定脚本执行权限后使用./执行的效果一样
# 会在当前父Shll中开启一个新的子shell来执行
# 子shell只会继承父shell中的环境变量，并不会继承父shell中定义的变量信息
Bash test.sh
sh test.sh  
./test.sh #相对路径
/document/gbyukg/test.sh  #绝对路径

# 使用source或使用. /(中间有空格)执行脚本，并不会开启一个子shell，而是直接在当前父shell中执行。
source test.sh
. /test.sh



# shell排错
# 检查语法
Bash -v test.sh
# 不执行，只查看Script程序代码
Bash -n test.sh
# 追踪Script的执行
Bash -x test.sh
# 强制变量一定要先经过声明才能使用
shopt -o -s nounset



#错误输出输出到与标准输出相同的位置
2>&1

# 在shell脚本中设定使用变量前必须先定义该变量can shu
# -s是打开选项的意思；-o是指可用set -o设定的选项，nounset表示变量一定要先设定才能使用
shopt -s -o nounset



#定义环境变量
declare -x myname='zzl'
# 或使用export命令，该命令是吧某一个变量输出，变成环境变量
myname=zzl
export myname

export -p 会列出目前所有的环境变量



# declare说明
-r # 定义只读属性
-i # 定义整数
-a # 定义数组
-f # 定义函数


# unset删除定义的变量或方法
unset -v 变量名称 # 删除变量(-v为默认参数)
unset -f 函数名 # 删除函数


# 删除环境变量
# 如果要从程序的环境中删除变量，可以使用env命令，env也可以临时改变环境变量值
env -i PATH=$PATH HOME=$HOME LC_ALL=C awk '...' file1 file2
# -i选项是用来初始化环境变量的，也就是丢弃任何的继承值，仅传递命令行上指定的变量给程序使用。


#常见参数说明
$n        #$1 the first parameter,$2 the second...
$#        #The number of command-line parameters.
$0        #The name of current program.
$?        #Last command or function's return value.
$$        #The program's PID.
$!        #Last program's PID.
$@        #Save all the parameters.

# 子shell，在shell中将命令用小括号括起来，则该命令将会在当前shell中开启一个子shell来执行
(a=5)
echo $a #a为空