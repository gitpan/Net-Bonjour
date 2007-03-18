use ExtUtils::MakeMaker;

print "Enable enterprise tests? [y/N]";
chomp(my $ans = <STDIN>);
my $tests = 't/*.t';
if ( $ans =~ /^y/i ) {
        print "Enterprise tests enabled.\n";
        print "Enterprise test will query HTTP service records from zeroconf.org\n";
	$tests = 't/*.t t/*.ot';
} else {
        print "Enterprise tests will be skipped.\n";
}

WriteMakefile(
	'NAME' => 'Net::Bonjour',
	'VERSION_FROM' => 'lib/Net/Bonjour.pm',
	'DISTNAME' => 'Net-Bonjour',
	'PREREQ_PM' => { 'Net::DNS' => 0.44, 'Socket' => 1.75 },
	'AUTHOR' => 'George Chlipala <george@walnutcs.com>',
	'test' => { 'TESTS' => $tests }
)
