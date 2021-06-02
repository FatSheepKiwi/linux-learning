#!/bin/sh
if [ $1 = "start" ]
then
    # run it in background
    docsify serve docs -p 3000 &
elif [ $1 = "stop" ]
then 
    kill -9 $(ps -ef | grep docsify | grep -v grep | awk '{print $2}')
elif [ $1 = "restart" ]
then 
    kill -9 $(ps -ef | grep docsify | grep -v grep | awk '{print $2}')
    docsify serve docs -p 3000 &
elif [ $1 = "add" ]
then 
    if [ -e ./docs/article/$2.md ]; then
        echo "File $2.md already exists!"
    else
        echo "# $2\n\n\n" >> ./docs/article/$2.md
        echo "## 语法\n\n\`\`\`\n\t\n\`\`\`\n" >> ./docs/article/$2.md
        echo "## 常用选项\n\n\n" >> ./docs/article/$2.md
        echo "## 进阶选项\n\n\n" >> ./docs/article/$2.md
        echo "## 实例\n\n\n" >> ./docs/article/$2.md
        echo "<!--\n\n-->\n\n[Home](/)" >> ./docs/article/$2.md
        echo "- [$2](article/$2.md)" >> ./docs/README.md
    fi
elif [ $1 = "ref" ]
then
    open https://linuxize.com/post/$2-command-in-linux/
    open https://www.runoob.com/linux/linux-comm-$2.html
    open https://man.linuxde.net/$2
else
    echo "Unknown command, please check."
fi