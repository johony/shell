# C、C++、C#、Java代码格式化工具
sudo apt-get install astyle
#常用参数
-f    # 在两行不相关的代码之间插入空行
-p    # 在操作符两边插入空格，如=、+、-等。
      # 如：int a=10*60;
      # 处理后变成int a = 10 * 60;
-P    # 在括号两边插入空格。另，-d只在括号外面插入空格，-D只在里面插入。
      # 如：MessageBox.Show ("aaa");
      # 处理后变成MessageBox.Show ( "aaa" ); 
-U    # 移除括号两边不必要的空格。
      # 如：MessageBox.Show ( "aaa" );
      # 处理后变成MessageBox.Show ("aaa");
-V    # 将Tab替换为空格。


# https://github.com/einars/js-beautify
# 格式化js工具

# http://www.waterproof.fr/products/phpCodeBeautifier/
# php格式化工具

# sudo apt-get install tidy
# html、css格式化工具