# pwd

`pwd`，英文全称是 print work directory。`pwd`指令用于获得目前所在的工作目录的绝对路径，输入后，命令会把从根目录起到当前目录的全路径写入标准输出，使用`/`分隔，第一个`/`表示根目录，最后一个目录就是当前目录啦。

`pwd`指令所做的事情其实很简单，它只是打印`了$PWD`这个环境变量，如果输入以下内容，会获得相同的输出：

```
$ echo $PWD
/home/foo
```

## 语法

```
    pwd [OPTIONS]
```

## 常用选项

和`cd`命令一样，`pwd`命令也只能接受两个参数：

* `-L`，logical，不解析符号链接，是`pwd`命令的默认选项。
* `-P`，physical，显示的是真实的物理目录，不使用任何符号链接。

## 实例

```
$ pwd
/home/foo
```

<!--
https://man.linuxde.net/pwd
https://www.runoob.com/linux/linux-comm-pwd.html
https://linuxize.com/post/current-working-directory/
-->

[Home](/)
