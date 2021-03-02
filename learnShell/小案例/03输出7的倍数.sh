#!/bin/bash

# 写出一个bash脚本可以输出0-500中7的倍数0,7,14，... 等数字

# 最简单的：seq 0 7 500

# echo '--------for loop'
# for ((i = 0; i < 500; i++)); do
#     res=$(expr $i % 7)
#     if [[ $res -eq 0 ]]; then
#         echo $i
#     fi
# done

# echo '--------while loop'
# i=0
# while [[ $i -lt 500 ]]; do
#     if [[ $(expr $i % 7) -eq 0 ]]; then
#         echo $i
#     fi
#     i=$(expr $i + 1)
# done

# echo '--------until loop'
# i=0
# until [[ $i -gt 20 ]]; do
#     if [[ $(expr $i % 7) -eq 0 ]]; then
#         echo $i
#     fi
#     let i+=1
# done

echo '--------loop and case'
for ((i = 0; i < 50; i++)); do
    res=$(expr $i % 7)
    case $res in
    0)
        echo "0"
        ;;
    1)
        echo "1"
        ;;
    2)
        echo "2"
        ;;
    3)
        echo "3"
        ;;
    4)
        echo "4"
        ;;
    5)
        echo "5"
        ;;
    *)
        echo "6"
        ;;
    esac
done
