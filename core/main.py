#!/usr/bin/python
import sys


def read_file(path):
    with open(path, "r") as fs:
        while True:
            data = fs.readline()
            if data:
                yield data
            else:
                break


print("Using arguments: {}".format(sys.argv))

filepath = sys.argv[1]

print("Using file: {}".format(filepath))

for line in read_file(filepath):
    pass
