#!/usr/bin/env perl
use 5.010;

my ( $decimal, $base ) = @ARGV;
my @ans_digits;
my $prefix;
if ( $base == 16 ) {
    $prefix ='0x';
}
elsif ( $base = 2 ) {
    $prefix = '0b0'
}
else {
    $prefix = '0*';
}
my @supradecimal = qw/ A B C D E F /;

while ( $decimal > 0 ) {
    my $remainder = $decimal % $base;
    if ( $remainder < 10 ) {
        unshift @ans_digits, $remainder;
    }
    else {
        unshift @ans_digits, $supradecimal[ $remainder - 10 ];
    }

    $decimal = ( $decimal - $remainder ) / $base;
}

say "$decimal in base $base = $prefix" . join "", @ans_digits;
