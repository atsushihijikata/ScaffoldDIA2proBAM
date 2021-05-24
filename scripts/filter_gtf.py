import os, sys
import gzip


def main():
    transcript_file = sys.argv[1]
    gtf_file = sys.argv[2]
    transcript_list = {line.rstrip().split('|')[0].replace('>', ''):True for line in open(transcript_file) if line.startswith('>')}

    for line in gzip.open(gtf_file, 'rt'):
        if line.startswith('#'):
            print(line.rstrip())
            continue
        cols = line.rstrip().split('\t')
        trns = [t for t in cols[8].split(';') if 'transcript_id' in t]
        if len(trns) == 0:
            continue
        trns = trns[0].split()[-1].replace('"', '')
        if trns in transcript_list.keys():
            print(line.rstrip())





if __name__ == '__main__':
    main()
