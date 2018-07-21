#!/usr/bin/env python

import json
from sys import argv

if len(argv) < 2:
    print 'Usage: json-field-printer.py jsons_file field1 [field2 ...]'

with open(argv[1], 'r') as f:
    for l in f:
        j = json.loads(l)
        fields = [j[x].encode('utf-8') if x in j else '' for x in argv[2:]]
        print ','.join(fields)

