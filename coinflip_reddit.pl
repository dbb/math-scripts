#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

my $flips = 0;
my $play = 1;

say "Starting the game:";

while ( $play ) {
    my $a = flip();
    my $b = flip();
    say "New turn: A is $a, B is $b";
    turn( $a, $b );
}


sub turn {
    my $x = shift; # a
    my $y = shift; # b

    if ( $x eq 'heads' and $y eq 'heads' ) {
        say "Both heads.";
        $play = 0;
        end();
    }
    elsif ( $x eq 'tails' and $y eq 'tails' ) {
        say "Both tails; new flip";
        $x = flip();
        $y = flip();
        say "A got $x, B got $y";
        turn( $x, $y );
    }
    elsif ( $x eq 'heads' and $y eq 'tails' ) {
        say "A will flip again";
        until ( $x eq 'tails' ) {
            $x = flip();
            say "A gets $x";
        }
    }
    elsif ( $x eq 'tails' and $y eq 'heads' ) {
        say "B will flip again";
        until ( $y eq 'tails' ) {
            $y = flip();
            say "B gets $y";
        }
    }
    else {
        die "Bad value";
    }
}

sub end {
    say "The game is over. Total flips: $flips";
}

sub flip {
    # update the flip counter
    $flips++;
    say "    flips: $flips";
    # pseudo-randomly generate 0 or 1
    my $n = int( rand( 2 ) );
    # we will arbitrarily assign 1 to heads
    ( $n == 1 ) ? return "heads" : return "tails";
}

sub test_flip {
    # flip the coin 10 times and print the results
    for ( 0..9 ) {
        say "Result is: " . flip();
    }
}
