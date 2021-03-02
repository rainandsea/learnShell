#!/bin/bash

# echo 命令用于字符串的输出，格式：echo string

# 1. 显示普通字符串
echo 'It is a test'
echo It is a test

# 2. 显示转义字符
echo "\"It is a test\""

# 3. 显示变量
read name # 用于与用户交互，相当于Python中的input
echo "$name It is a test"

# 4. 显示换行
echo -e "OK! \n" # -e 开启转义，并在bash下有效，sh下无效; \n表示换行
echo "It is a test"

# 5. 显示不换行
echo -e "OK! \c" # -e 开启转义，\c不换行
echo "It is a test"

# 6. 显示结果，重定向至文件
echo "It is a test" >myfile # myfile可以是任意类型文本文件，如.txt, .csv等

# 7. 原样输出字符串，不进行转义或取变量（使用单引号）
echo '$name \"'

# 8. 显示命令执行结果
echo $(date)

a=true
b="true"
if [[ $a == $b ]]; then
    echo "shell中没有布尔变量"
fi
