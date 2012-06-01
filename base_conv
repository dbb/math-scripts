#!/usr/bin/env python

import sys

try:
    decimal     = int( sys.argv[1] )
    base        = int( sys.argv[2] )
except:
    print( "\nUsage:\n\tbase_conv [decimal] [base]\n" )

# end try

hex_digits  = []
ans         = "0x"

digit = [ 'A', 'B', 'C', 'D', 'E', 'F' ]

while decimal > 0:
    remainder = decimal % base
    if remainder < 10:
        hex_digits.append( remainder )
    else:
        hex_digits.append( digit[remainder-10 ] )
    decimal = ( decimal - remainder ) / base
    # end if

    if decimal==0:
        break
    # end if

hex_digits.reverse()

for i in hex_digits:
    ans += str( i )
# end for

print( ans )

