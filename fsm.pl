#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

## dbbolton
## Simple finite state machine example
## https://github.com/dbb/math-scripts

my $state = 0;
output();

prompt();
while ( <STDIN> ) {
    chomp;

    if ( /^([01])$/ ) {
        if ( $state != $1 ) {
            $state = $1;
#            say "\t( state updated )";
            output();
        }
        else {
            say "\t( state already $state )";
        }
    }
    elsif ( /\S/ ) {
        say "\t( invalid input )";
    }
    prompt();
}

sub output {
    say "\t( state = $state )";
}

sub prompt {
    print '> ';
}

## https://github.com/dbb/math-scripts

