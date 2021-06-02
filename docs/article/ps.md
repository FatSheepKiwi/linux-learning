# ps

在 Linux 系统中，一个程序的运行实例被叫做进程，所以当你想要知道有多少在后台运行的程序的时候，·ps·指令就是用来列出所有正在运行的进程信息的，它是英文 process status 的缩写。

需要注意，ps命令列出的是进程的快照，就是执行·ps·命令的那个时刻的进程信息，所提供的查看结果并不是动态连续的。如果想要动态的显示进程信息，可以使用·top·命令。

## 语法

```
	ps [OPTIONS]
```

·ps·指令看起来语法简单，然而因为历史原因，它为了在各个版本的系统中兼容以及提供各种不同的功能，五花八门的选项多的吓人。

- UNIX 风格，选项前有“-”
- BSD 风格，不使用破折号
- GNU 长格式，选项前有“--”

其中，BSD 风格和 UNIX 风格是可以聚合使用的，比如最常用的·ps aux·。

## 常用选项


## 常规使用

如果只输入·ps·没有任何选项，其实它能提供的信息非常有限。此时，·ps·输出的信息只有四列，且至少有两行正在运行的进程信息，shell 本身以及此时在执行的命令——·ps·。
···
    $ ps
···
输出如下：
···
  PID TTY          TIME CMD
 1809 pts/0    00:00:00 bash
 2043 pts/0    00:00:00 ps
···

输出的四个列头为·PID·，·TTY·，·TIME·和·CMD·。

- ·PID·，进程 ID。通常来说，使用·ps·指令就是为了进程的 ID 信息，这样我们就可以再调用·kill·指令来结束进程。
- ·TTY·， 控制这个进程的终端的名字。·TTY·是 Teletype 或 Teletypewriter 的缩写，原来是指电传打字机，后来这种设备逐渐被键盘和显示器取代。现在的`TTY`用来泛指计算机的终端(terminal)设备，这里不详细展开讨论了。
- ·TIME·，这个进程合计的 CPU 使用时间。
- ·CMD·，启动这个进程的命令的名字。

这些信息确实不够全面，所以·ps·的真实实力还是要靠加上不同的选项来实现。

### 全面输出—— BSD 格式

···
    $ ps aux
···

- ·a·选项告诉·ps·来列出所有用户的进程。
- ·u·选项则表示用一种“面向用户”的格式，详细的展示进程信息。
- ·x·选项让·ps·不管终端，列出所有的进程，目的是包括那些在系统启动时就开始运行在系统后台的进程。

这样一来，显示的信息扩展到了11列。·USER·，·PID·，·%CPU·，·%MEM·，·VSZ·，·RSS·，·STAT·，·START·，·TTY·，·TIME·以及·CMD·。

···
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.8  77616  8604 ?        Ss   19:47   0:01 /sbin/init
root         2  0.0  0.0      0     0 ?        S    19:47   0:00 [kthreadd]
...
···

除了上面介绍过的四种，剩下的还有：

- ·USER·，启动这个进程的用户是谁。
- ·%CPU·，CPU 使用比例。
- ·%MEM·，进程使用的物理内存比例。
- ·VSZ·，KiB（KB是错误的哦。K for Kilo-，十进制千；Ki for Kibi-，二进制千）为单位的虚拟内存使用量。
- ·RSS·，KiB为单位的物理内存使用量
- ·STAT·，进程的状态码，如·Z·(zombie)，·S·(sleeping)还有·R·(running)。
- ·START·，进程的开始运行时间。

Linux 的进程有5种状态，所以对应了5种·STAT·状态码。

|Linux 进程状态|·STAT·状态码|
|-|-|
|运行<br>(正在运行或在运行队列中等待) |·R· 运行 runnable |
|中断<br>(休眠中，受阻，在等待某个条件的形成或接受到信号) |·S· 中断 sleeping |
|不可中断<br>(收到信号不唤醒且不可运行，进程必须等待直到有中断发生) |·D· 不可中断 uninterruptible sleep |
|僵死<br>(进程已终止，但进程描述符存在，直到父进程调用`wait4()`系统调用后释放) |·Z· 僵死 zombie |
|停止<br>(进程收到`SIGSTOP`，`SIGSTP`，`SIGTIN`，`SIGTOU`信号后停止运行运行) |·T· 停止 traced or stopped |

·ps·指令还支持按照某个条件来排序输出：

···
ps aux --sort=-%mem
···

### 全面输出—— UNIX 格式

···
ps -ef
···

- ·-e·选项表示列出所有进程。
- ·-f·选项，full-format，表示进程详细信息。

这样的 UNIX 格式会输出8列，·UID·，·PID·，·PPID·，·C·，·STIME·，·TIME·和·CMD·。

···
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 19:47 ?        00:00:01 /sbin/init
root         2     0  0 19:47 ?        00:00:00 [kthreadd]
...
···

不包括在基本的选项中的4列的含义如下：
·UID ·，类同于·USER·，运行这个进程的用户是谁。
·PPID·，父进程的 ID。
·C·，类同于·%CPU·，进程的 CPU 使用情况。
·STIME·，类同于·START·，命令的执行时间。

### ps 与管道

用·ps·输出所有的进程信息颇有些“大炮打蚊子”了，我们可以使用管道·|·来搭配其他命令使用。

比如你只需要属于·root·用户的进程信息，可以搭配·grep·命令。

···
ps -ef | grep root
···

又或者想把·ps·的输出信息按页来展示，就可以使用管道加·less·命令。

···
ps -ef | less
···

<!--
https://linuxize.com/post/ps-command-in-linux/
https://www.runoob.com/linux/linux-comm-ps.html
https://man.linuxde.net/ps
https://www.cnblogs.com/peida/archive/2012/12/19/2824418.html
-->

[Home](/)
