#!/bin/bash

# 假设nowcoder.txt有很多内容，请输出指定行的内容，如第5行

head -n 5 nowcoder.txt | tail -n 1 # 先输出前5行，然后输出对应的最后一行

sed -n 5p nowcoder.txt # -n 仅显示处理后的结果，5p 打印第5行

j=0

for i in $(cat nowcoder.txt); do
    if [[ $j -eq 4 ]]; then
        echo $i
    fi
    # let j+=1
    j=$(expr $j + 1)
done
