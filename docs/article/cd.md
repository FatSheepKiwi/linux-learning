# cd

`cd` ，也可以写作`chdir`（change directory），意思是改变目录，是在Unix、类Unix、Windows和DOS操作系统下用于改变工作目录的命令行命令。`cd` 就像在图形界面中双击一个文件夹的图标，无时无刻不在使用它。

在使用 `cd` 时，可以使用 `Tab` 键自动完成目录名称。要切换到目录，要注意使用的用户必须对该目录具有可执行权限。

## 语法

```
    cd [OPTIONS] [DIRECTORY NAME]
```

## 常用选项

实际上，我们并不经常使用 `cd` 命令的选项，并且它也很单纯，就只有两种选项：

* `−L`，logical，使用符号链接，这也是 `cd` 的默认选项。
* `−P`, physical，不使用符号链接，如果要切换到的目标目录是一个符号连接，在 `−P` 指令下不会切换到符号连接目录，而是去往真正的目标目录。

举个例子：

```
$ cd /tmp
$ mkdir -p foo/bar
$ ln -s foo/bar a
$ cd a
$ pwd
/tmp/a
$ cd -P ../a
$ pwd
/tmp/foo/bar
```

## 实例

* `cd ` 进入用户主目录。
* `cd ~` 进入用户主目录，同上。
* `cd -` 前工作目录将被切换到环境变量`OLDPWD`所表示的目录，也就是返回进入当前目录之前所在的目录，类似于后退。
* `cd ..` 返回上级目录（若当前目录为`/`，则执行完后还在`/`，`..`为上级目录的意思）。
* `cd ../..` 返回上两级目录。
* `cd ../foo` 进入上级目录下的`/foo`目录。
* `cd !$` 把上一条命令的参数作为当前参数使用。
* `cd 'Dir name with space'`
* `cd Dir\ name\ with\ space` 如果要更进入的目录名称中带有空格，则应在路径加上引号或使用反斜杠`\`字符来转义该空格。

<!-- 
https://linuxize.com/post/linux-cd-command/
https://www.runoob.com/linux/linux-comm-cd.html
https://zh.wikipedia.org/wiki/Cd_(%E5%91%BD%E4%BB%A4)
what is cd -p
https://unix.stackexchange.com/questions/356595/examples-of-options-to-bash-cd-eg-cd-pe-directory
-->

[Home](/)
