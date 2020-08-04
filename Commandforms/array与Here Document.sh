# 定义数组
a[0]=1
a[1]=5
a[2]=10
# 或
a=(1 5 10)

#获取数组某一元素
#数组元素从0开始
${a[1]}

#获取所有数组元素
#将数组所有元素取出，各个元素之间使用空白隔开
${a[@]}
#将数组所有元素取出，得到一整个字符串
${a[*]}

#获取数组元素的个数
${#a[@]}
#或
${#a[*]}


wc -l <<HERE
line 1
line 2
line 3
line 4
HERE

#Here Document支持变量替换
cat > $Em << HERE
line 1
$line
line 2
line 3
HERE

#关闭变量替换功能
cat << 'HERE'
$a
$b
HERE

#利用Here Document作批量注释
: <<DO-NOTTHING
第一行批注
第二行批注
第三行批注
DO-NOTTHING

#利用Here Document打包c程序
echo "正在产生hello.c..."
echo
cat << 'EOF' > hello.c
#include <stdio.h>

int main()
{
    printf("Hello world!\n");
    return 0;
}
EOF

echo "编译hello.c..."
echo
# 编译hello.c,产生执行文件
gcc -o hello hello.c

#若编译成功，则执行
if [ $? -eq 0 ]; then
    echo "执行hello..."
    echo
    ./hello
else
    echo 'Compile ERROR:hello.c'
fi
