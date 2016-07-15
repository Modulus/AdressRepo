#!/usr/bin/python
# coding=utf-8
import codecs
import sys

from pymongo import MongoClient
from pymongo import TEXT


# Read file in a generator expression
def read_file(path):
    with codecs.open(path, "r", encoding="UTF-8") as fs:
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


client = MongoClient("mongodb://localhost:27017")
db = client.demo
address_col = db.address

#Delete collection if present
print("Dropping collection of addresses")
address_col.delete_many({})

#Create compound indices for full text search
address_col.create_index([
    ("country_code", TEXT),
    ("postal_code", TEXT),
    ("place_name", TEXT),
    ("admin_name1", TEXT),
    ("admin_name2", TEXT),
    ("admin_name3", TEXT),
])





# Split line on the tab character since this is the delimiter.
for line in read_file(filepath):
    parts = line.split("\t")
    if parts and len(parts) >= 12:
        address = {
            "country_code": parts[0],
            "postal_code": parts[1],
            "place_name": parts[2],
            "admin_name1": parts[3],
            "admin_code1": parts[4],
            "admin_name2": parts[5],
            "admin_code2": parts[6],
            "admin_name3": parts[7],
            "admin_code3": parts[8],
            "latitude": parts[9],
            "longitude": parts[10],
            "accuracy": parts[11].strip()
        }
        address_col.insert(address)
    else:
        print("Error!!!")

print("Done importing all data")
