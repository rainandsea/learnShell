#!/bin/bash

# 假设文件nowcoder.txt内容多于5行

tail -n 5 nowcoder.txt # tail和head可以直接输出前5行或后5行

cat nowcoder.txt | tail -n 5
