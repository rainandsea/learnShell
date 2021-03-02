#!/bin/bash

# ====== 定义变量 ======
your_name='Life is short'
# 注意：
# 1. !!!!!!!!!!!变量名和等号之间不能有空格!!!!!!!!!!
# 2. 命名只能使用数字，字母，下划线，且首字母不能是数字
# 3. 中间不能有空格，但可以使用下划线
# 4. 不能使用bash里的关键字(可以使用help命令查看保留关键字)

# 除了显示的直接赋值，还可以用语句给变量赋值
# for file in 'ls /home/ute' 或者 for file in $(ls /home/ute)

# ====== 使用变量 ======
# 使用一个定义的变量，只要在变量名前面加上美元符号$即可，也可以将变量名用花括号括起来{}
# 变量名外面加{}是为了帮助解释器识别变量的边界
# 推荐给所有的变量加上{}，这是一个好的编程习惯
echo $your_name
echo ${your_name}
echo $your_nameisgood   # 输出为空，找不到变量your_nameisgood
echo ${your_name}isgood # 输出Life is shortisgood

for file in $(ls /home/ute/shell); do
    echo $file
    echo ${file}
done

# 变量可以被重新定义
your_name='Tom'
echo ${your_name}
your_name='alibaba' # 重定义的时候不用加$，只有在使用的时候才加$
echo ${your_name}

# ====== 只读变量 ======
# 使用readonly命令可以将变量定义为只读变量，只读变量的值不能被改变或重新定义
myUrl='https://www.baidu.com'
readonly myUrl
# myUrl='https://www.nokia.com'

# ====== 删除变量 ======
# 使用unset命令可以删除变量: unset variable_name
# 变量被删除后不能再次使用，且unset命令不能删除只读变量
echo 'unset 删除变量'
echo $your_name
unset your_name
echo $your_name # 此时输出空, 并不会报错

echo 123
echo '123'

# ====== 变量类型 ======
# 运行shell脚本时，会存在三种变量：
# 1. 局部变量：在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量
# 2. 环境变量：所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量
# 3. shell变量：由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量都称之为环境变量。

# ====== Shell字符串 ======
# 字符串是shell编程中最常用最有用的数据类型（除了数字和字符串，也没啥其他类型好用了），字符串可以用单引号，也可以用双引号，也可以不用引号
# 建议还是使用引号

# 单引号
str='this is a string'
echo ${str}
# 单引号字符串的限制：
# 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
# 单引号字符串中不能出现单独一个的单引号，但可以成对出现作为字符串拼接使用

# 双引号
your_name='runoob'
str="Hello, I know you are \"${your_name}\"! \n"
echo $str
# 双引号的优点：
# 1. 双引号里可以有变量
# 2. 双引号里可以出现转义字符

# 字符串拼接
your_name="runoob"
# 使用双引号拼接
greeting="Hello,"$your_name"!"
greeting1="Hello,${your_name}!" # 推荐这种方式
greeting1="Hello,$your_name"    # 推荐这种方式, 但注意$val后一般要接空格
echo ${greeting} ${greeting1}

# 使用单引号拼接
greeting1='hello, '$your_name'!' # 单引号拼接成功
greeting2='hello, '${your_name}'!'
greeting3='hello, ${your_name}!' # hello, ${your_name}!
greeting4='hello, $your_name!'   # hello, $your_name!
echo ${greeting1} ${greeting2} ${greeting3} ${greeting4}

# 获取字符串长度
string='abcd'
echo ${#string}
echo "长度为：${#string}"

# 提取子字符串：切片
string="runoob is a great site"
echo ${string:1:4}   # 输出 unoo, 注意必须要用bash命令运行
echo ${string:3}     # 输出 oob is a great site, 注意必须要用bash命令运行，从左边第四个数字开始
echo ${string:0-2:1} # 输出 t，从右边第2个开始，取一个数

# 查找字符串起始位置，相当于Python中的index方法
string="runoob is a great site"
echo $(expr index "${string}" io)   # 查找字符i或o的位置，哪个字母先出现就计算哪个
echo $(expr index "${string}" "gr") # 查找 ge 的位置

# ====== shell数组 ======
