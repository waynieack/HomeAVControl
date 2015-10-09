#!/usr/bin/perl
use Net::Ping;
$tvip = $ARGV[0];
$p = Net::Ping->new();
 if ($p->ping($tvip,1)) { print "ON\n" }
 else { print "OFF\n" } 
$p->close();
