#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

for ( @ARGV ) {
    my $sum;
    my @digits = reverse( split "", $_ );
    for ( my $i=0; $i<=$#digits; $i++) {
        my $hex= hex($digits[$i]);
        say "$digits[$i] to the $i";
        $sum += $hex * 16 ** $i;

    }
say "sum = $sum";
}

