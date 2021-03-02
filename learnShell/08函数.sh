#!/bin/bash

# 函数定义格式如下
demoFunc() {
    echo "这是我的第一个shell函数！"
}

echo "--------函数开始执行--------"
demoFunc
demoFunc
echo "--------函数执行完毕--------"
echo "--------无return返回值：$?--------"

# 注意点：调用函数时，不需要添加()，这点和Python有区别
funWithReturn # 这里会报错的，command not found
# 带有return语句的函数
funcWithReturn() {
    echo "这个函数对输入的两个数字进行相加运算"
    echo "输入第一个数字："
    read aNum
    echo "输入第二个数字："
    read bNum
    echo "两个数字分别为 $aNum 和 $bNum"
    # return $(($aNum + $bNum))
    return $(expr $aNum + $bNum)
}
funcWithReturn
echo "输入的两个数字之和是：$?"

# 函数如果包含return，就会将return后对应的结果返回
# 如果没有显示的return语句，将以最后一条命令运行结果作为返回值,范围在0-255之间
# 不存在向Python中可以使用变量去接收函数的返回值，而是通过 $? 去获取对应的返回值的
# !!! 所有函数必须在使用前先定义。 函数调用仅使用其函数名即可 !!!

# 函数参数
# 在shell中，调用函数时可以向其传递参数。在函数体内部，通过 $n 的形式来获取参数的值。例如 $1 代表第一个参数，以此类推
funcWithParam() {
    echo "第1个参数: $1"
    echo "第2个参数: $2"
    echo "第3个参数: $3"
    echo "第4个参数: $4"
    echo "第5个参数: $5"
    echo "参数的总个数：$#"
    echo "作为一个字符串输出所有参数：$*"
}

funcWithParam 10 20 30 40 50
funcWithParam 'a' 'b' 'c' 'd' 'e' 'f'

# 需要注意的是，当参数个数超过10个时，需要使用${10}, ${11}等来获取对应的值
echo "--------几个特殊字符用来处理参数，与执行shell脚本是传递参数代表意思相同--------"

funcWithParamSpecialChar() {
    echo "传递到脚本或函数的参数个数：$#"
    echo "以一个单字符串显示所有向脚本传递的参数：$*"
    echo "脚本运行的当前进程ID号：$$"
    echo "脚本运行的最后一个ID号：$!"
    echo "显示最后命令的退出状态，0表示没有错误，其他任何值表示有错误：$?"
}

funcWithParamSpecialChar 1 a 2 B 3 PYTHON 4

echo '$?仅对上一条指令负责，一旦函数返回后没有立即保存参数，那么其返回值将不能再通过$?获得'
funcWithReturn
sum=$?
echo "sum: $sum"
echo $?
