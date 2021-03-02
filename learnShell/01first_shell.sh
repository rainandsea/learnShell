#!/bin/bash
echo 'Hello World!中国' # echo命令用于向窗口输出文本

# 运行shell脚本有两种方式，#!是一个约定的标记，它告诉系统这个脚本需要什么解释器来执行，常见的如: #!/bin/bash, #!/bin/sh
# 方式1, 作为可执行程序：cd到.sh文件所在目录，chmod +x ./01first_shell.sh，然后输入./01first_shell.sh就可以执行了
# 方式2, 作为解释器参数：直接将文件名作为运行解释器参数，如sh test.sh 或 bash test.sh
# 第二种方式运行脚本时，不需要在第一行指定解释器信息，写了也没用

# 从 ubuntu 6.10 开始，ubuntu 就将先前默认的 bash shell 更换成了dash shell，其表现为 /bin/sh 链接倒了 /bin/dash 而不是传统的 /bin/bash。
# 可以通过 ls -l /bin/*sh

echo "文件扩展名不一定要.sh, 可以是其他任意的"
