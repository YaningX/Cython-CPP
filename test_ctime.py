#!/usr/bin/env python
import sys

print("Import ctime...", end="")

try:
    import ctime
except:
    print("Fail")
    sys.exit(1)
else:
    print("Ok")

print("Instantiate Time object...", end="")
try:
    t = ctime.Time()
except:
    print("Fail")
    sys.exit(1)
else:
    print("Ok")

print("Call member functions...", end="")
try:
    t.get_time()
    t.set_time("17:28:00")
    t.get_date()
    t.set_date("20170326")
except:
    print("Fail")
else:
    print("Ok")
