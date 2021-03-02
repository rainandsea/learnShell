#!/bin/bash

# 假设nowcoder.txt中有10行内容

wc -l nowcoder.txt                        # 对应的输出为: 10 nowcoder.txt  即会同时输出对应的文件名

wc -l nowcoder.txt | awk '{print $1}'     # 输出10

cat nowcoder.txt | wc -l                  # 也可以输出10

wc -l <nowcoder.txt                       # 采用输入重定向

awk '{print NR}' nowcoder.txt | tail -n 1 # 先打印出所有的行号然后只输入最后一个10

sed -n '$=' nowcoder.txt # -n打印，$=最后一行的行号
