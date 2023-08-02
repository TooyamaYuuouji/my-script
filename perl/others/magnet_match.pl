use strict;
use warnings;

my $dir = '.'; # 搜索目录，默认为当前目录
my $magnet = "magnet:?xt="; # 定义磁链头

opendir my $dh, $dir or die "cannot open the $dir: $!\n";
open my $w_fh, '>>', "target.txt" or die "cannot open the target.txt: $!\n"; # 打开待写入文件


	while (my $file = readdir $dh) {
		next unless $file =~ m/source/; # 打开源文件

		open my $fh, '<', $file or die "cannot open the $file: $!\n";
			while (my $line = <$fh>) {
				next unless $line =~ m/\burn:btih:([A-F\d]+)\b/i;
				
				my $magnet_temp = $magnet;
				$magnet_temp .= $&;
				
				print $w_fh $magnet_temp, "\n";
			}
		close $fh;
		
	}

close $w_fh;	
closedir $dh;

print '='x20, " run over ", '='x20;
