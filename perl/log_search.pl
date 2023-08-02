#!/usr/bin/perl
=pod
在当前目录下搜索 .log 文件，并查找其中含有关键字的语句
=cut


use strict;
use warnings;

use File::Find;

# 下面这种方式只能遍历当前目录，无法遍历子目录
#my $dir = shift || '.'; # 默认当前目录
#opendir my $dh, $dir or die "cannot open $dir: $!\n";
#	while (my $file = readdir $dh) {
#		next unless $file =~ /\.log$/;
#		print $file;
#	}
#closedir $dh;


# 想要遍历子目录，需使用 File::Find 模块和子程序
my $dir = '.'; # 默认当前目录
my $str = shift || "debug"; # 默认查找字符串为 debug

find(\&wanted, $dir);


# 供 find 使用的子程序
sub wanted {
	if ($_ =~ /\.log$/) {
		open my $fh, '<', $_ or die "cannot open $_: $!\n";
    	my @context = <$fh>; 
    	close $fh;
    	
    	print "current file: $File::Find::name\n";
    	check_log(@context);
	}
}

# 检查读取的文件内容
sub check_log {
	foreach (@_) {
		if ($_ =~ /$str/) {
			print "\t", $_;
		}
	}
}
