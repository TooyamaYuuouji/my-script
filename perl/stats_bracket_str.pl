#!/usr/bin/perl
=pod
对指定文件，查找并统计其方括号（[]）中字符串出现的次数，并按照字母表顺序输出统计情况
每行只会统计一次方括号，而不会对一行中的多个方括号内容进行统计！
=cut

use warnings;
use strict;

my $targetFile = shift; # 待统计的文件
my $result = "";
my %counts; # 计数用字典

open my $fd , "<", $targetFile or die "cannot open $targetFile: $!\n";
while(<$fd>) {
    my $line = $_;
    chomp($line);
    # print $line, "\n";
    if (/\[(.*?)\]/) {
        # print "$1\n";
        $counts{lc($1)} ++; # 可以使用key值索引字典中的某一个数据
    }
}

# 排序，并存储格式化字符串
foreach my $key (sort keys %counts) {
    $result = $result.sprintf("%-20s:%-4s\n", $key, $counts{$key});
}

print $result;