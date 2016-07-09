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


# The data format is tab-delimited text in utf8 encoding, with the following fields :
#
# country code      : iso country code, 2 characters
# postal code       : varchar(20)
# place name        : varchar(180)
# admin name1       : 1. order subdivision (state) varchar(100)
# admin code1       : 1. order subdivision (state) varchar(20)
# admin name2       : 2. order subdivision (county/province) varchar(100)
# admin code2       : 2. order subdivision (county/province) varchar(20)
# admin name3       : 3. order subdivision (community) varchar(100)
# admin code3       : 3. order subdivision (community) varchar(20)
# latitude          : estimated latitude (wgs84)
# longitude         : estimated longitude (wgs84)
# accuracy          : accuracy of lat/lng from 1=estimated to 6=centroid

print("Using arguments: {}".format(sys.argv))

filepath = sys.argv[1]

print("Using file: {}".format(filepath))

first = True

# Split line on the tab character since this is the delimiter.
for line in read_file(filepath):
    parts = line.split("\t")
    if first:
        print(parts)

    first = False


