# mkdir

`mkdir`，全称是 make directory，创建目录，或者说大家更熟悉的说法，创建文件夹。用于创建一个新的目录，并且在创建的过程中可以为新目录赋予权限。

## 语法

```
    mkdir [OPTION] [DIRECTORY NAME]
```

类似于`ls`，`mkdir`也可以一次性创建多个目录的，只需要将目录名用空格分开即可。

## 常用选项

* `-m` 或`--mode xxx`，可以建立目录的同时设置目录的权限。
* `-p` 或`--parents` 如果所要建立的目录，它的上层目录还没有创建，使用`-p`选项会一并建立上层目录。

## 实例

在当前工作目录下，建立一个名为`newdir`的子目录；绝对路径也可以的接受：
```
    mkdir newdir
    mkdir /home/tmp/dir2
```

在当前目录中建立`parent`和它下的`sub`目录，权限设置为拥有者可读、写、执行；同组用户可读和执行；其他用户无权访问：
```
    mkdir -m 750 parent/sub
```

关于为什么是`750`来表示权限，可以参考[usmask]()（我还没写）

如果你想创建`/home/user/food/sheep`，但是`/home/user/food`目录都还没有创建：
```
$ mkdir /home/user/food/sheep
```

因为父目录还没有创建，此时只能得到错误信息（来自OS的 没这东西的吐槽）：
```
$ mkdir: cannot create directory '/home/user/food/sheep': No such file or directory
```

不需要自己手动去创建上一级的目录，只需要使用`-p`选项来帮助自动创建:
```
$ mkdir -p /home/user/food/sheep
```

如果忘记自己已经创建过这个目录了，再次创建同名目录也会报错的：
```
$ mkdir newdir
mkdir: cannot create directory 'newdir': File exists
```

最后是一个例子可能不太常用，但是可以体现`mkdir -p`的强大功能。你可以使用花括号`{}`来创建一棵复杂的目录树：
```
    $ mkdir -p food/{vegetable/tomato,meat,snack,fruit/{apple,banana,orange}}
```

```
food
├── fruit
│   ├── apple
│   ├── banana
│   └── orange
├── meat
├── snack
└── vegetable
    └── tomato
```

<!--
https://www.runoob.com/linux/linux-comm-mkdir.html
https://linuxize.com/post/how-to-create-directories-in-linux-with-the-mkdir-command/
https://man.linuxde.net/mkdir
-->

[Home](/)
