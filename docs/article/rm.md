# rm

`rm`，英文 remove ，它用于删除一个文件或者目录。删库跑路，你只需要一个`rm -rf`，这也算是个老程序员笑话了。笑谈归笑谈，`rm`命令威力强大，所以使用`rm`命令要格外小心，因为一旦删除了一个文件，就无法再恢复它。

## 语法

```
    rm [OPTIONS]... FILE...
```

## 常用选项

* `-d`，directory，删除目录时需要指定这个指令。
* `-f`，force，强制删除文件或目录。
* `-i`，inquiry，删除已有文件或目录之前会先询问用户，得到 yes 回应后才会删除。
* `-r`或`-R`，recursively，递归处理，会一并把子目录里的内容删个干净。
* `-v`，verbose，显示指令的详细执行过程，用于你想要知道具体哪些文件被删除了的情况。

## 实例

交互式删除当前目录下的文件test和example

```
$ rm -i test example
remove test ? n（no，不删除文件test)
remove example ? y（yes，删除文件example)
```

删除当前目录下除隐含文件外的所有文件和子目录（跑路警告！如果是`rf`将爆炸），`*`是一个表示所有文件的通配符。

```
$ rm -r *
```


<!--
https://linuxize.com/post/rm-command-in-linux/
https://www.runoob.com/linux/linux-comm-rm.html
https://man.linuxde.net/rm
-->

[Home](/)
