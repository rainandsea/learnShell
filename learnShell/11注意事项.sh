#!/bin/bash

# 1. 在bash中，$()和``(反引号)的作用和区别
# 作用：两者都是用来做  命令替换  的。
# 命令替换和变量替换差不多，都是用来重组命令行的，先完成引号里的命令行，然后将其结果替换出来，再组成新的命令行
# 在操作上，两者都达到相同的效果，推荐使用$()，因为比较直观, 而``容易与''混乱；
# 但$()的弊端是不是所有的类unix系统都支持，反引号是都支持的
echo '$()和``是用来做 命令替换 的'
# cat $(ls -v *.txt) >full.txt
# cat $(ls -v *dl.csv) >full_dl.csv
# cat $(ls -v *ul.csv) >full_ul.csv

# 2. 变量替换使用 $var 或 ${var}，${}可以更精确的界定变量名称的范围
echo '$AB 表示变量AB'
echo '${A}B 表示变量A后连接着B'

for name in *.txt; do
    echo "文件名为: $name"
done

for name in $(ls -v *.robot); do
    echo "文件名为: $name"
done

files=$(ls -v *.robot) # 结果是一个字符串，可以使用循环去遍历字符串元素
echo "files: $files"

s="I am a student"
for i in $s; do
    echo "s: $i"
done

cmd1='sshpass -p oZPS0POrRieRtu ssh toor4nsn@192.168.255.1 bsh 1:0 cat /tmp/test.txt'
cmd2='sshpass -p oZPS0POrRieRtu ssh toor4nsn@192.168.255.1;bsh 1:0;cat /tmp/test.txt'
cmd3='sshpass -p oZPS0POrRieRtu ssh toor4nsn@192.168.255.1 && bsh 1:0 && cat /tmp/test.txt'

echo $($cmd1)
echo $($cmd2)
echo $($cmd3)
