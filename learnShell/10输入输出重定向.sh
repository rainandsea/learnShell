#!/bin/bash

# -------- 输出重定向 --------
# 格式：command >file   # 将命令执行结果输出到指定文件file，会覆盖原文件
# 格式：command >>file  # 将命名执行结果以追加方式输出的文件file

# -------- 输入重定向 --------
# 格式：command <file   # 从文件file读出命令并逐个执行

# -------- 其他 --------
# 格式：n >file         # 将文件描述符为n的文件重定向到file
# 格式：n >>file        # 将文件描述符以追加的方式重定向到file
# 格式：n >&m           # 将输出文件m和n合并
# 格式：n <&m           # 将输入文件m和n合并
# 格式：<<tag           # 将开始标记tag和结束标记tag之间的内容作为输出
who >users.txt
cat users.txt
who >>users.txt
echo -e "second: \n$(cat users.txt)"
echo "www.baidu.com" >>users.txt
echo -e "third: \n$(cat users.txt)"

# 统计users中文件行数
wc -l users.txt                     # 同时输出行数和文件名
wc -l <users.txt                    # 仅输出行数

ssh toor4nsn@192.168.255.1 <test.sh # 在远程服务器上执行本地脚本

# -------- 重定向深入讲解 --------
# 一般情况下，每个Unix/Linux下命令运行时都会打开三个文件
# 标准输入文件stdin:  描述符为0, 默认从stdin读取数据
# 标准输入文件stdout: 描述符为1, 默认向stdout输出数据
# 标准输入文件stderr: 描述符为2, 默认向stderr流中写入错误信息

# Important: 默认情况下，上面三个标准文件就是终端，即命令行窗口或屏幕

# 如果希望stderr重定向到file
ls 2>err.txt  # 命令执行成功，err.txt中无内容
lll 2>err.txt # 命令执行失败，错误信息写入文件：-bash: lll: command not found

# 如果希望stdin和stderr合并后重定向到file, 格式：command >file 2>&1 或者 command >>file 2&1
# 只能是 2>&1，不能是 1>&2
echo '开始了' >outerr.txt 2>&1
pwd >>outerr.txt 2>&1
xxx >>outerr.txt 2>&1

# 如果希望stdin和stdout都重定向，格式：command <infile >outfile

# -------- /dev/null 文件 --------
# 如果希望执行某个命令，但又不希望在屏幕上显示输出结果，那么可以将输出重定向到/dev/null
# 格式：command >/dev/null
# /dev/null是一个特殊文件，写入到它的内容都是被丢弃，如果尝试从该文件中读取内容，那么什么也读不到
# 但这个文件/dev/null非常有用，将命令的输出重定向到它，会起到“禁止输出”的效果

# 如果希望屏蔽stdout和stderr，可以这样写
# command >/dev/null 2>&1
ls /home/ute >/dev/null 2>&1
