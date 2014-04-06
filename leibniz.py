#!/usr/bin/env python
import sys
count = int( sys.argv[1] )
sum = 0
for i in range( count ):
    sum += ((-1)**i ) / ( 2*i + 1 )
    pi = sum * 4
print(pi)
