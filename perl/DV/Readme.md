# add_define.pl
该脚本在当前目录下查找指定名字的文件，并对该文件添加 `ifndef` 等头文件标识以及对应的尾部 `endif` 标识

使用方式如下：
``` perl
> perl add_define.pl test.txt

add defines success!

>
```


# log_search.pl
该脚本在当前目录以及当前目录的子目录中递归搜索log文件，并查找含有指定字符串的行，找到后将该行输出到终端

使用方式如下：
``` perl
> perl log_search.pl debug

current file: ./current.log
        [debug] this is in current.log
current file: ./sub/sub.log
        [debug] this is in sub.log

>
```


# replace_in_current_files.pl
该脚本在当前目录中搜索指定文件（默认为txt文件），并全局替换字符串，区分大小写

_注意：需手动修改代码中的变量 `file_ex`，才可实现对其他类型文件的内容替换_

使用方式如下：
``` perl
> perl replace_in_current_files.pl DEBUG CMPARE

replace string DEBUG to CMPARE success!

>
```


# stats_bracket_str.pl
该脚本在当前目录中搜索指定文件，并统计该文件每一行中出现在中括号（[]）内部的字符串的次数

使用方法如下：
``` perl
> perl stats_bracket_str.pl test.txt

apple : 1
banana: 2
pear  : 1

>
```

