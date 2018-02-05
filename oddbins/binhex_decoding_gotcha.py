#!/usr/bin/env python3

import base64

original=b"hello, world!" # because it's assumed you want to encode a binary...
encoded=base64.b16encode(original)

print("{} after encoding {}".format(original, encoded))

encoded=encoded.lower()
print("\nSome hex encoders lower case the hexadecimal digits: {}".format(encoded))

# this will fail
try:
    decode=base64.b16decode(encoded)
except base64.binascii.Error as e:
    print("\tFailed to decode: ", e)

encoded=encoded.upper()
print("\nSo uppercase it: {}".format(encoded))

# this will work
try:
    decode=base64.b16decode(encoded)
except base64.binascii.Error as e:
    print("\tWhoops! Failed to decode: ", e)

print("Back again...{}".format(decode))
