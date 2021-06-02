# mv

`mv`，是 move “移动”的简写，用来为文件或目录改名，或将文件或目录移动到其它位置。

## 语法

```
	mv [OPTIONS] SOURCE DESTINATION
```

`SOURCE`可以是一个或多个文件或目录，而`DESTINATION`可以是单个文件或目录。要执行`mv`，必须在`SOURCE`和`DESTINATION`都拥有写权限。

- 如果将单个文件指定为`SOURCE`，并且`DESTINATION`目标是存在的目录，则该文件将移动到指定目录。
- 当将多个文件或目录指定为`SOURCE`，`DESTINATION`必须是一个已存在的目录。在这种情况下，`SOURCE`文件们将移动到目标目录。
- 如果将一个文件指定为`SOURCE`，并将一个文件指定为`DESTINATION`目标，那么执行的则是重命名。

## 常用选项

- `-b`，backup，当目的地目录有同名文件存在时，在默认覆盖前，为它创建一个备份。
- `-f`，force，若目标文件或目录与现有的文件或目录重复，则强制覆盖。
- `-i`，inquiry，覆盖前先行询问用户。用户输入`y`或`yes`，表示将覆盖；输入`n`或`no`，表示取消对源文件的移动，以避免文件覆盖。
- `-n`, 不覆盖任何已存在的文件或目录；意味着只有不重名的文件才会被移动。
- `-v`，verbose，使用此选项时，命令将详细显示每个移动文件或重命名的操作。

## 实例

将文件`file1`从当前工作目录移动 到`/tmp/test`目录。

```
    $ mv file1 /tmp/test
```

如果`DESTINATION`有重名文件，则可以使用以下`-b`选项创建该文件的备份。备份文件的名称与原始文件的名称相同，并~附加一个波浪号（）。

```
    $ mv -b file1 /tmp/test
    $ ls /tmp/test/file1*
    /tmp/test/file1  /tmp/test/file1~
```

`DESTINATION`为另一文件时，执行的就是重命名操作。

```
    $ mv abc.txt cba.txt
```

移动目录的语法与移动文件时的语法相同。如果`dir2`目录存在，该命令将移动`dir1`到`dir2`目录下；如果`dir2`不存在，`dir1`将被重命名为`dir2`。

```
    $ mv dir1 dir2
```

`mv`命令还支持使用模式匹配。例如，要将所有pdf文件从当前目录移动到该`~/Documents`目录。

```
mv *.pdf ~/Documents
```

<!--
https://linuxize.com/post/how-to-move-files-in-linux-with-mv-command/
https://www.runoob.com/linux/linux-comm-mv.html
https://man.linuxde.net/mv
-->

[Home](/)
