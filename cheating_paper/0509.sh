1. / binディレクトリ下のファイルで1文字目がcで3文字のファイルの一覧

ls /bin/c??
# cd /bin
# ls c??
# cd -


2. カレントディレクトリにディレクトリ（dir1 / dir2 / dir3）作成

mkdir -p dir1/dir2/dir3


3. ディレクトリdir3下にファイル（file01からfile10の10ファイル）を作成

touch dir1/dir2/dir3/file{01..10}


4. ダイレクトdir3下にファイル（file01からfile05の5ファイル）を削除

rm dir1/dir2/dir3/file{01..05}


5. ディレクトリdir1をすべて削除

rm -r dir1
