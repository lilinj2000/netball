#!/usr/bin/python

import re
import sys

file_name = "sfnettest_pingpong.log"

if len(sys.argv)>1:
    file_name = sys.argv[1]

IDX_SIZE = 1
IDX_MEAN = 2
IDX_ILE = 6

def processLine(line):
    words = re.split('\W+', line)

    if len(words) == 10 and words[IDX_SIZE] in ["2048", "32"]:
        print "%s\t%s\t%s" % (words[IDX_SIZE], words[IDX_MEAN], words[IDX_ILE])

with open(file_name) as file:
    for line in file:
        processLine(line)

