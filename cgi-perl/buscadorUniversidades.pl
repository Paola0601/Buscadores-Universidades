#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use CGI::Carp qw(fatalsToBrowser); 

my $cgi =CGI->new;
$cgi->charset('UTF-8');
print $cgi->header;