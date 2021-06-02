# cat

`cat`命令是 Linux 中使用最广泛的命令之一，意思是英文中的 con**cat**enate ，连接。它可以读取，连接和写入文件内容到标准输出。最常见的用法是显示一个或多个文本文件的内容、附加内容到另一个文件的末尾，以及创建新文件。

## 语法

```
	cat [OPTIONS] [FILES]
```

## 常用选项

- `-n`，number，从1开始对所有输出的行数进行编号。
- `-b`，和`-n`相似，只不过对于空白行不编号。
- `-s`，当遇到有连续两行以上的空白行，就代换为一行的空白行。

## 实例

`cat`命令最基本，最常用的用法是读取文件的内容，输出到终端。

```
    $ cat hello.txt
    Hello World!
```

也可以使用`>`指定重定向到文件，例如将的内容复制`file1.txt`到`file2.txt`（当然一般情况下我们会用`cp`指令）。如果file2.txt文件不存在，则会新建一个文件；否则，将会使用`file1.txt`覆盖文件。

```
    $ cat file1.txt > file2.txt
```

使用`>>`运算符将会追加内容，而不是覆盖。

```
    $ cat file1.txt >> file2.txt
```

要显示带有行号的文件内容，则使用`-n`选项。

```
cat -n /etc/lsb-release
1 hello
2 hi
3 how are you
4 I am fine, thank you, and you?
5 I am fine, too.
```

当将两个或多个文件名作为cat命令的参数传递时，文件的内容将被串联在一起。`cat`会按照其参数中给出的顺序读文件，然后以相同的顺序显示文件的内容。

```
    $ cat file1.txt file2.txt
```

也可以串联两个或多个文本文件并将其写入文件。

```
    $ cat file1.txt file2.txt > combinedFile.txt
```

使用`cat`创建小文件通常比打开文本编辑器更快捷方便。

```
    $ cat > file1.txt
```

<!--
https://linuxize.com/post/linux-cat-command/
https://man.linuxde.net/cat
-->

[Home](/)
