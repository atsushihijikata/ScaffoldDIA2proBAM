#!/usr/bin/env python
import os, sys
import pandas as pd


def main():
    infile = sys.argv[1]
    outfile = sys.argv[2]

    new_columns = {
            'Sequence': 'peptide', 'Modifications': 'modification', 'Charge': 'assumed_charge',
            'Sample': 'spectrum', 'Protein Accessions': 'protein', 'Precursor MZ': 'score'
            }
    data = pd.read_csv(infile)
    data = data[data['Sequence'].notna()]
    for i, row in data.iterrows():
        m = str(row['Modifications'])
        if m == 'nan':
            data.loc[i:i+1, 'Modifications'] = "-1"
        else:
            m = m.split()[0]
            data.loc[i:i+1, 'Modifications'] = m

    new_data = data.rename(columns=new_columns)
    new_data['hit_rank'] = 1
    new_data['num_missed_cleavages'] = 0
    new_data['NTT'] = 1

    df = new_data[['spectrum', 'peptide', 'protein', 'score', 'modification', 'assumed_charge', 'hit_rank', 'num_missed_cleavages', 'NTT']]

    #df = df.sample(n=500)
    df.to_csv(outfile, sep="\t", index=None)


if __name__ == '__main__':
    main()
