import os, sys

fasta_file = sys.argv[1]
for line in open(fasta_file):
    if line.startswith('>'):
        dt = line.rstrip().replace('>', '').split('|')
        print(">" + "|".join(map(str, [
            dt[1], "|".join(dt[2:])
            ])))
    else:
        print(line.rstrip())
