import os, sys
import gzip

seq = ''
for line in gzip.open(sys.argv[1], 'rt'):
    if line.startswith('>'):
        if seq != '':
            print(header)
            print(seq)
        header = line.rstrip()
        seq = ''
    else:
        seq += line.rstrip()

print(header)
print(seq)
