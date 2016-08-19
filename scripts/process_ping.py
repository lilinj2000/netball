#!/usr/bin/python

import re
import sys

file_name = "ping_11.log"

if len(sys.argv)>1:
    file_name = sys.argv[1]

IDX_INTEGER = 12
IDX_FRACTION = 13

def processLine(line):
    words = re.split('\W+', line)

    if len(words) == 16:
        print "%s.%s" % (words[IDX_INTEGER], words[IDX_FRACTION])

with open(file_name) as file:
    for line in file:
        processLine(line)

