#!/usr/bin/env python
# source: http://stackoverflow.com/questions/1405913/ddg#1405971

import sys

if sys.maxsize > 2**32:
    print("64 bit")
else:
    print("32 bit")

# anything older than 2.6
import struct
print( str(8 * struct.calcsize("P")) + " bit" )

