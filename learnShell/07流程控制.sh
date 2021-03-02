#!/bin/bash

# ======== if ========
a=10
b=20
if [[ $a == $b ]]; then
    echo "a等于b"
elif [[ $a -gt $b ]]; then
    echo "a大于b"
else
    echo "a小于b"
fi

# ======== for ========
for i in 1 2 3 4; do
    echo "The value is: $i"
done

for str in This is a string; do
    echo $str
    echo "current: $str" # 字符串拼接的时候才使用引号
done

for ((i = 0; i < 10; i++)); do
    echo "loop index: $i"
done

for ((i = 0; i <= 5; i++)); do
    echo "self index: $i"
done

# ======== while ========
int=1
while (($int <= 5)); do
    echo "while index: $int"
    let int++
    # 自加操作
done

int=10
while [[ $int -ge 1 ]]; do
    echo "while index: $int"
    let "int--"
    # 自减操作
done

int=10
while [[ $int -ge 1 ]]; do
    echo "while index: $int"
    let int-=3
done

# echo "按下CTRL+D退出循环"
# echo -n "输入你喜欢的歌手："
# while read singer; do
#     echo "你输入的歌手名字是: $singer"
# done

# ======== 无限循环 ========
# while true; do
#     echo 'loop...'
# done

# for (( ; ; )); do
#     echo "for looping..."
# done

# ======== until ========
a=0

until [[ ! $a -lt 10 ]]; do
    echo "until loop: $a"
    a=$(expr $a + 1)
done

# ======== case esac ========
echo "请输入1到4之间的数字："
echo "你输入的数字为："
read aNum

case $aNum in
1)
    echo "你选择了1"
    ;; # ;;一定要有
2)
    echo "你选择了2"
    ;;
3)
    echo "你选择了3"
    ;;
4)
    echo "你选择了4"
    ;;
*) # 如果没有匹配，用*来匹配改值
    echo "你没有输入1到4之间的数字: $aNum"
    ;;
esac

site='runoob'

case $site in
'runoob')
    echo "菜鸟教程"
    ;;
'goole')
    echo "goole 搜索"
    ;;
'taobao')
    echo "淘宝网"
    ;;
esac

# ======== 跳出循环 ========
# 常用命令两个: break 和 continue
# 参考在Python中的用法
while true; do
    echo -n "输入1到5之间的数字："
    read aNum # read命令用于获取用户输入
    case $aNum in
    1 | 2 | 3 | 4 | 5)
        echo "你输入的数字为： $aNum"
        ;;
    *)
        # echo "你输入的数字不在1和5之间，游戏结束"
        # break
        echo "你输入的数字不在1和5之间，请继续"
        continue
        ;;
    esac
done

mkdir test
echo $(pwd) # /home/ute/shell
cd test/
echo $(pwd) # /home/ute/shell/test
