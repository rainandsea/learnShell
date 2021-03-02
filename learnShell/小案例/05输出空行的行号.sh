#!/bin/bash

# 给定文件nowcoder.txt，输出空行对应的行号

awk '/^$/ {print NR}' nowcoder.txt
awk '{if($0=="") {print NR}}' nowcoder.txt # $0代表行内容本身，判断是否为空字符串
awk '{if(NF==0) {print NR}}' nowcoder.txt  # NF代表改行字符数量，判断字符数量是否为0

sed -n '/^\s*$/=' nowcoder.txt # sed 也支持正则匹配，= 表示打印行号

# loop_counter=$(wc -l nowcoder.txt | awk '{print $1}')
# echo "loop_counter: $loop_counter"
# for ((i = 0; i < $loop_counter; i++)); do
#     line=$(expr $i + 1)
#     res=$(sed -n ${line}p nowcoder.txt)
#     length=${#res}
#     if [[ $length -eq 0 ]]; then
#         echo $line
#         #statements
#     fi
# done

# echo "--------for loop"
# j=1
# for i in $(cat -A nowcoder.txt); do
#     if [[ $i == '$' ]]; then
#         echo $j
#     fi
#     let j+=1
# done
