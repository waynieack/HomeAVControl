#!/usr/bin/perl

my $script = $ARGV[0];
my $repeat = $ARGV[1];

    for (my $i=0; $i <= $repeat; $i++) {
       `$script`;
    }
