## ScaffoldDIA2proBAM ver 0.1
### ScaffoldDIAから出力されたファイルをproBAMフォーマットに変換する



### Prerequisite

- Python (3.6 or later)
- R (4.0 or later) & Bioconductor
- mariadb-client
- samtools

実行環境は、LinuxもしくはMacOSを想定しています。

### セットアップ
### 1. Pythonのインストール
Anacondaを以下のURLよりダウンロードしてインストールします。
https://www.anaconda.com/

### 2. Rのインストール
Rを以下のURLよりダウンロードしてインストールします。
https://www.r-project.org/

### 3. BioconductorとproBAMrパッケージのインストール
Rを起動し、以下のコマンドを入力して、BioconductorとproBAMrをインストールします。

```
 $ R

R version 4.1.0 (2021-05-18) -- "Camp Pontanezen"
Copyright (C) 2021 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin17.0 (64-bit)
...

>install.packages("BiocManager")
>BiocManager::install("proBAMr") 
```


### 使い方
1. Prepare human genome annotation data from GENCODE.

```
$ sh run_preproc.sh > setup.log 2> setup.err
```

Note: Once you execute the script successfully, you do not need rerun this script.


2. Convert ScafoldDIA format to proBAM.

```
$ sh run_tab2sam.sh INPUT_FILE OUTPUT_DIR/
```

### Example:

```
$ sh run_tab2sam.sh sample_data/peptide_test.csv sample_data/result
```

