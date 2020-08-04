#################################################################################
# 命令的结束状态 
#
# 每条命令执行后都会传回一个状态码，执行成功后返回0
# 执行失败返回非0值
# 执行某个命令失败，产生严重错误，返回128+n
# 命令不存在，返回127
# 没有权限执行命令，返回126
#
# $?用来存放每条命令执行完毕后返回的值
#
#################################################################################

#常用判断选项
#文件
-a file exists. 
-b file exists and is a block special file. 
-c file exists and is a character special file. 
-d file exists and is a directory. 
-e file exists (just the same as -a). 
-f file exists and is a regular file. 
-g file exists and has its setgid(2) bit set. 
-G file exists and has the same group ID as this process. 
-k file exists and has its sticky bit set. 
-L file exists and is a symbolic link. 
-n string length is not zero. 
-o Named option is set on. 
-O file exists and is owned by the user ID of this process. 
-p file exists and is a first in, first out (FIFO) special file or named pipe. 
-s file exists and has a size greater than zero. 
-S file exists and is a socket. 
-t file descriptor number fildes is open and associated with a terminal device. 
-u file exists and has its setuid(2) bit set. 
-r file exists and is readable by the current process. 
-w file exists and is writable by the current process. 
-x file exists and is executable by the current process. 
-z string length is zero. 

#字符串比较
-eq    #等于
-ne    #不等于
-gt    #大于
-lt    #小于
-le    #小于等于
-ge    #大于等于
-z     #空串
=      #两个字符相等
!=     #两个字符不等
-n     #非空串

#条件测试写法
#执行某一命令的结果，可包括管道命令，如命令1 | 命令2 | 命令3
# 结束状态为最后一个命令执行的结果
if grep -q "rm" fn.sh; then
    echo "find rm command."
else
    echo "not find."
fi

# 传回某一命令的相反值
# 其形式为：! 命令
# 注：!和命令之间要有空格隔开
if ! grep -q "rm" fn.sh; then
    echo "not find."
else
    echo "find rm command."
fi

#使用复合命令((算式))
((0))       #假
((1))       #真
((2-2))     #假
((2<3))     #假
((2&&3))    #真
((0||1))    #真
((2|1))     #真

# 使用Bash关键字[[ 和 ]]:[[ 判断式 ]]
# 注意[[ 和 ]]与判断式之间至少含有一个空格
if [[ abc > xyz ]]; then
    ...
fi

# 使用内置命令:test
# 注：特殊字符需要转义
if test "xyz" \> "abc"; then
    ...
fi

# 使用内置命令:[]
# 用法同test一样，也需要转义
if [ "xyz" \> "abc" ]; then ... fi

# 使用-a、-o进行逻辑组合
# -a:且;-o:或
if [ -f filename -a -x filename ]; then ... fi

# 命令&&和||
# 命令1 && 命令2：命令1为真是才会执行命令2
# 命令1 || 命令2：命令1为假时才会执行命令2
if grep -q "rm" fn.sh && [ $a lt 100 ]; then
    ...
fi
# 常用做隐形的if语法
[ -z $PS1 ] && return

# &&与||合用
[ -n ${DEBUG:-} ] && set -v || set +v

# 注:在[[ 判断是 ]]中，如果使用==或!==，且在这两个运算符右边的字符串上没有加上单引号或双引号，
# 则会视为对比的是该字符串的样式，如果相符，传回0，不符则传回1
a="str"
if [[ $a == ??? ]]; then
    echo '相同'
fi

[ -e "/etc/hosts" ] || (echo "文件不存在"; exit 1)
if [ "$?" -eq 1 ]; then
    exit
fi


# case条件判断式
read name
case $name in
    Jack | Jone | Joe)
        echo "loooooooooooo"
        echo "LOL"
        ;;
    (Mary | May) echo "Niiiiiiiiiiii";;
    C*) echo "Tooooooooooooooooo";;
    *) echo "Hiiiiiiiiiiii";;
esac

# Bash3.1引入了新选项nocasemath，可以让bash在对比样式时忽略大小写
shop -s nocasemath



# select命令可建立简易列表，列表的选项，即串行中的各个字段。列表提示符号由Bash的内置变量PS3来定义，可通过修改该变量来修改默认提示符。
# select会给各个选项一个编号，由1开始递增。当使用者键入编号选择其中一项时，该选项的内容就设置给选项变量，而键入的编号存放在REPLY变量中。

select 选项变量 in 串行
do
    命令区域
done

# 使用者每键入一次编号，就执行一次命令区域，会一直循环下去
# 在命令区域中输入break命令，或按Ctrl-D结束输入

PS3='请选择:'
select f in *
do
    echo "你键入的编号是$REPLY，选择的文件是:$f"
    break
done

PS3='请选择:'
select f in "/ /root /etc /home /"
do
    echo "你键入的编号是$REPLY，选择的文件是:$f"
    break
done