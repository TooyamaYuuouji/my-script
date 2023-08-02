#!/usr/bin/perl

use strict;
use warnings;

my $file_name = $ARGV[0];
my $dir = '.'; # 默认为当前目录

=pod
在当前目录下找到指定文件名的文件
=cut
opendir my $dh, $dir or die "cannot opendir $dir: $!\n";
	my $match = 0;
	while (my $file = readdir $dh) {
 		next unless $file eq $file_name;
 	
 		$match = 1;
 	}
closedir $dh;

=pod
如果找到的话，进行后续处理，包括：
1.读取其中的内容，并保存在数组变量 @content 中
2.在首行和尾行加入 define 语句
=cut
if ($match == 1) {
	open my $fh, "<", $file_name or die "cannot open $file_name: $!\n";
		my @content = <$fh>;
	close $fh;
	
	open $fh, ">", $file_name or die "cannot open $file_name: $!\n";
		(my $new_name = $file_name) =~ s/\./_/; # 也属于正则匹配的内容，需按照正则匹配的要求来。将 . 变为 _
		$new_name = uc $new_name;				# 转为大写字符
		print $fh '`ifndef ', $new_name, "\n";
		print $fh "`define $new_name", "\n"x2;
		print $fh @content;
		print $fh "\n"x2, "`endif // $new_name";
	close $fh;
	print "\n add defines success!\n";
} else {
	print "cannot find $file_name\n";
}
