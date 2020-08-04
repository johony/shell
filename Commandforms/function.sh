# 默认情况下在函数内定义的变量是全局可见的，
# 为了避免造成混乱，可在变量前加上local关键字使之成为局部变量

function get_name()
{
  local name
  ...
}

# 获取函数的参数同样使用位置参数${n}
# $0代表脚本名，$1~${n}代表传递给函数的参数


# 指定位置参数值
# Bash提供了一个set命令，用来重置参数
declare -i i=0
set 1 2 3 4 5
for i in $@
do
  ((i++))
  echo "第$i个位置参数\$$i = $p"
done
# 一旦使用set命令重置位置参数后，原有参数将会消失
# 可以使用set --使其重置所有参数为空


# 获取命令行参数和选项
# Bash的内置命令getopts可获取传递的选项和参数，用法：

getopts 选项行 选项变量

# 其中选项行，是由各个选项的单一字符组成，如获取./test.sh -a -u Jack -h的选项，可以组合成
u:ah
# 如果某一个选项字符后方，接上:，则表示该选项需要提供一个参数，如这里的u后面有: 。如果执行Script
# 时，选项u后方没有提供额外的参数，那么Bash就会显示"option requires an argument --u"的错误信息。
# 若不想出现这种错误信息，可在选项行最前面加上:，如：
:u:ah
# 这时就算u后面没有参数，也不会产生错误信息
# getopts由命令行取得选项，把它放入选项变量中，如果该选项需要额外的参数，参数值会放入OPTARG这个变量中。

while getopts u:a:h opt
  do
      case $opt in
        u)
        echo "提供了选项u和参数：$OPTARG";;
        a)
        echo "提供了选项a和参数：$OPTARG";;
        h)
        echo "提供了选项h";;
        *)
        ;;
      esac
  done



# 使用函数库
# 可以将常用的函数定义到一个文件中，如mylib.sh，一般在定义函数库中的函数名称时，通常在名称前面加上"_"，如_getIp
# 通过在其它脚本中使用. /路径/mylib.sh或source /路径/mylib.sh方式将函数库引入到当前脚本中