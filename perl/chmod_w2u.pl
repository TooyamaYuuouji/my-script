#!/usr/bin/perl

=pod
将通过Windows共享文件夹转移到Ubuntu的所有文件夹及文件的权限修改成合适的情况，其中：
文件夹取消掉其他用户的写权限，对应shell指令：chmod o-w
文件取消掉所有的执行权限，对应shell指令：chmod -x
=cut