#!/bin/bash

# shell支持多种运算符，包括：
# 算数运算符： 用于比较数字，但 == 和 != 可以用于字符串
# 关系运算符： 只支持数字或字符串的值是数字
# 布尔运算符： 包括 与 或 非 操作
# 逻辑运算符： 对应逻辑的AND和OR
# 字符串运算符： 只支持字符串对象
# 文件测试运算符

# ======== 算数运算符 ========
# 注意点：
# 1. 表达式和运算符之间要有空格，例如2+2是不对的，要写成2 + 2
# 2. 完整的表达式要被 ` ` 包含，这个字符不是常用的单引号，在ESC键下面; 或者使用$(expr 表达式)这种形式
# 3. 条件表达式要放在方括号[]之间，并且要有空格，例如[$a==$b]是错误的，必须写成[ $a == $b ]
echo "======== 算数运算符 ========"

a=10
b=20
echo "a的值：${a}"
echo "b的值：${b}"

val=$(expr $a + $b)
echo "a + b: $val"
echo "a + b: ${val}" # 推荐

val=$(expr $a - $b)
echo "a - b: ${val}"

val=$(expr $a \* $b) # 乘号必须加转义符
echo "a * b: ${val}"

val=$(expr $a / $b)
echo "a / b: ${val}"

val=$(expr $a % $b)
echo "a % b: ${val}"

if [[ $a == $b ]]; then
    echo "a和b相等"
fi

if [[ $a != $b ]]; then
    echo "a和b不相等"
fi

# ======== 关系运算符 ========
echo "======== 关系运算符 ========"
if [[ $a -eq $b ]]; then
    echo "$a -eq $b : a等于b"
fi

if [[ $a -ne $b ]]; then
    echo "$a -ne $b : a不等于b"
fi

if [[ $a -gt $b ]]; then
    echo "$a -gt $b : a大于b"
fi

if [[ $a -lt $b ]]; then
    echo "$a -lt $b : a小于b"
fi

if [[ $a -ge $b ]]; then
    echo "$a -ge $b : a大于等于b"
fi

if [[ $a -le $b ]]; then
    echo "$a -le $b: a小于等于b"
fi

# ======== 布尔运算符 ========
echo "======== 布尔运算符 ========"
if [[ $a != $b ]]; then
    echo "$a != $b: a不等于b"
elif [[ $a == $b ]]; then
    echo "$a == $b: a等于b"
else
    echo "None"
fi

if [ $a -lt 100 -a $b -gt 15 ]; then # 此处只能使用单中括号[]，不能使用双[[]]
    echo "$a 小于100并且 $b 大于15：返回true"
else
    echo "$a 小于100并且 $b 大于15：返回false"
fi

if [ $a -lt 10 -o $b -gt 100 ]; then
    echo "$a 小于10或者 $b 大于100： 返回true"
else
    echo "$a 小于10或者 $b 大于100： 返回false"
fi

# ======== 逻辑运算符 ========
echo "======== 逻辑运算符 ========"
if [[ $a -lt 100 && $b -gt 100 ]]; then # 逻辑运算符必须使用双中括号[[]]
    echo "a小于100并且b大于100，返回true"
else
    echo "a小于100并且b大于100，返回false"
fi

if [[ $a -lt 100 || $b -gt 100 ]]; then
    echo "a小于100或者b大于100，返回true"
else
    echo "a小于100或者b大于100，返回false"
fi

# 综上：与 或 非操作建议分别使用 && || !，这样的话，条件表达式统一为双中括号[[]]

# ======== 字符串运算符 ========
echo "======== 字符串运算符 ========"
a="abc"
b="efg"
c="abc"

# 不推荐使用=判断，推荐==
if [ $a = $b ]; then
    echo "$a = $b字符串相同判断使用[]和=：返回true"
else
    echo "$a = $b字符串相同判断使用[]和=：返回false"
fi

if [[ $a == $b ]]; then
    echo "$a = $b字符串相同判断使用[[]]和==：返回true"
else
    echo "$a = $b字符串相同判断使用[[]]和==：返回false"
fi

if [[ $a == "abc" ]]; then
    echo "$a = abc字符串相同判断使用[[]]和==：返回true"
else
    echo "$a = abc字符串相同判断使用[[]]和==：返回false"
fi

if [[ $a == $c ]]; then
    echo "$a = $c字符串相同判断使用[[]]和==：返回true"
else
    echo "$a = $c字符串相同判断使用[[]]和==：返回false"
fi

if [[ $a != $b && $a == $c && $a == "abc" ]]; then
    echo "$a != $b and $a == $c and $a == abc: 返回true"
else
    echo "$a != $b and $a == $c and $a == abc: 返回false"
fi

# 检测字符串长度是否为0
if [[ -z $a ]]; then
    echo "$a 是空字符串，返回true"
else
    echo "$a 是空字符串，返回false"
fi

if [[ -n $b ]]; then
    echo "$b 不是空字符串，返回true"
else
    echo "$b 不是空字符串，返回false"
fi

if [[ $c ]]; then
    echo "$c 不是空，返回true"
else
    echo "$c 不是空，返回false"
fi

# ======== 文件测试运算符 ========
echo "======== 文件测试运算符 ========"

# 判断是否为目录
dir='/home/ute'
if [[ -d $dir ]]; then
    echo "$dir 是一个目录"
else
    echo "$dir 不是一个目录"
fi

# 判断文件是否可执行
file="/home/ute/shell/05运算符.sh"
if [[ -x $file ]]; then
    echo "$file 是可执行文件"
else
    echo "$file 不是可执行文件"
fi

# 判断文件或目录是否存在
if [[ -e $dir ]]; then
    echo "$dir 目录存在"
else
    echo "$dir 目录不存在"
fi

if [[ -e "/home/ute/shell/xxx" ]]; then
    echo "/home/ute/shell/xxx 目录存在"
else
    echo "/home/ute/shell/xxx 目录不存在"
fi

# 极个别只能通过单中括号[]，所以可以坚持使用双[]，有问题再议
