#!/usr/bin/env perl
use 5.010;
use Switch;

## Get the input.
## $decimal will be a "normal" base-10 number.
## $base will be the base of the output (16 for hex).
my ( $decimal, $base ) = @ARGV;

## Initialize this array to store the digits of the answer.
## We will be treating the new digits as characters and store them here.
my @ans_digits;

## The prefix is simply to make output easier to read. It uses the Perl
## convention of 0b for binary, 0x for hex, and 0 for octal.
my $prefix;
switch( $base ) {
    case 2  { $prefix = "0b" }
    case 8  { $prefix = "0"  }
    case 16 { $prefix = "0x" }
    else    { $prefix = ""   }
}

## This is the core of the algorithm. We start with a number, say 100, and we
## want to convert it to hex. First we compute the remainder with the modulus
## operator (%)
## 100 % 16 = 4
## This means that we can divide (100-4) by 16 and get an integer, or in
## other words 96 is a multiple of 16. This remainder will be the ones place
## in the hex answer.

while ( $decimal > 0 ) {
    my $remainder = $decimal % $base;

## This if-block is simply to convert "digits" greater than 9 into the
## corresponding letters.
    if ( $remainder < 10 ) {
        unshift @ans_digits, $remainder;
    }
    else {
        unshift @ans_digits, chr( $remainder + 55 );
    }

## At this point, we are going to prepare for the next iteration of the loop.
## We subtract the remainder and divide by the base, which we know will give
## us an integer.
##    ( 100 - 4 ) / 16 = 96 / 16 = 6
## So $decimal is now equal to 6, and the loop starts over. This time,
##     $remainder = 6 % 16 = 6
## And that is our second digit. When we recalulate $decimal, it will be 0:
##     $decimal = ( 6 - 6 ) / 16 = 0 / 16 = 0
## The loop is now finished, and we have our final answer.
    $decimal = ( $decimal - $remainder ) / $base;
## Could also be written as:
##    $decimal -= $remainder;
##    $decimal /= $base;
}

## Output.
say "$decimal in base $base = $prefix" . join "", @ans_digits;

## The alorithm may make sense if you think of the procedure for converting a
## hex to decimal backwards. Instead of mutilplying the first digit on the
## left by 16, we are dividing. There are no exponents involved here because
## the loop only calculates the *digits* in order.

