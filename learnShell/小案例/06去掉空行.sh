#!/bin/bash

# 给定一个文件nowcoder.txt，去掉文件中的空行

awk '{if(NF!=0) {print $0}}' nowcoder.txt
awk '{if($0!="") {print $0}}' nowcoder.txt

sed -n '/[^$]/p' nowcoder.txt # []表示取反

grep '\S' nowcoder.txt
