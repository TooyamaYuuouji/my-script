#!/usr/bin/perl

=pod
全局替换当前目录下的所有指定文件格式中的指定字符串。字符串严格匹配大小写
文件格式直接内部指定，如需修改为其他格式，需手动替换 file_ex 变量的内容
=cut

use strict;
use warnings;

my $dir = ".";
my $file_ex = "sv";
my $str = shift;
my $new_str = shift;

if (!$str or !$new_str) {
	print "Please enter two avaliable strings!\n";
}
else {
	opendir my $dh, $dir or die "cannot open $dir: $!\n";
	while (my $file = readdir $dh) {
		next unless $file =~ /\.${file_ex}/; 						# 查找文件
		open my $fh, '<', $file or die "cannot open $file: $!\n"; 	# 读取文件内容
		my @context = <$fh>;
		close $fh;
		foreach (@context) { 										# 替换文件内容
			$_ =~ s/$str/$new_str/g;
		}
		open $fh, '>', $file or die "cannot open $file: $!\n";		# 将替换后的内容覆盖至源文件
		print $fh @context;
		close $fh;
	}
	closedir $dh;
	print "\nreplace string $str to $new_str success!\n";
}
