#!/bin/bash

s='hello world'

# 获取字符串长度
for ((i = 0; i < ${#s}; i++)); do
    echo $i
done

# 输出字符串的每个单词
for i in $s; do
    echo $i
done

# while 循环
i=0
length=${#s}
echo "length: $length"
while [[ $i -lt ${#s} ]]; do
    res=$(expr $i % 2)
    if [[ $res -eq 0 ]]; then
        echo "第 $i 次循环"
    fi
    i=$(expr $i + 1)
done

dir="C:\comWork\robotws5g C:\comWork\robotws5g\sss"
for d in $dir; do
    if [[ -d $d ]]; then
        echo "是目录：$d"
    else
        echo "不是目录：$d"
    fi
done

file="C:\codeWork\learnShell\func_test.sh C:\codeWork\learnShell\常见问题"

for f in $file; do
    if [[ -x $f ]]; then
        echo "文件可执行：$f"
    else
        echo "文件不可执行：$f"
    fi
done

targets="C:\comWork\robotws5g C:\codeWork\learnShell\xxx.sh"

for t in $targets; do
    if [[ -e $t ]]; then
        echo "存在：$t"
    else
        echo "不存在：$t"
    fi
done

ans=0

for ((i = 0; i < 10; i++)); do
    ans=$(expr $ans + $i)
done

echo "前10个数的和：$ans"

echo "输出指定目录下的符合条件的文件名"

for i in $(ls -vd *.sh); do
    echo "文件名:$i"
done

list=(a b c 1 2 3)
echo "list元素个数：${#list[*]}"
echo "list元素个数：${#list[@]}"

for ((i = 0; i < ${#list[*]}; i++)); do
    echo "$i对应的元素是：${list[$i]}"
done
