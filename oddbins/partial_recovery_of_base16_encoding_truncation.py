#!/usr/bin/env python3

import base64

original=b"hello, world!" # because it's assumed you want to encode a binary...
encoded=base64.b16encode(original)

print("{} after encoding {}".format(original, encoded))

truncated=encoded[0:-1] # remove half a byte
print("Remove half a byte: ", truncated)
print("\n1st attempt to decode a truncated encoded stream.")
try:
    decoded=base64.b16decode(truncated)
except base64.binascii.Error as e:
    print("\tFailed to decode because decode. Details: {}".format(e))

if len(truncated) % 2 == 1: # how to detect if truncation has occurred
    fixed=truncated[0:-1]
print("\nRemove the other half byte: ", fixed)

print("\n2nd attempt to decode a fixed encoded stream, by removing the remaing half byte.")
decoded=base64.b16decode(fixed)
print("before: {} after fixing truncation: {}".format(original, decoded))


