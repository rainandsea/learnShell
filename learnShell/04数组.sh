#!/bin/bash

# shell数组用括号来表示，元素用空格符号分割开，语法格式如下：
# array_name=(value1 value2 value3 ... valuen)
my_array=(A B "C" D)

# 也可以使用下标来定义或新增数组元素
my_array[4]='E'
my_array[5]='f'

# 获取数组元素和其他变成语言一样，使用索引index，且index从0开始
# 基本格式：${array_name[index]}

echo ${my_array[0]}
echo ${my_array[1]}
echo ${my_array[2]}
echo ${my_array[3]}
echo "第5个元素值为：${my_array[4]}"

# 获取所有的元素
echo ${my_array[*]} # 获取所有元素使用 * 或者 @
echo ${my_array[@]}

# 获取元素的长度，与获取字符串长度的方法相同
echo "数组元素的个数：${#my_array[*]}"
echo "数组元素的个数：${#my_array[@]}"
