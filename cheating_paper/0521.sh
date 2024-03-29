リポジトリ下にディレクトリ（0521）を作成し、以下のスクリプトを格納コマンド
は一般ユーザで実行、標準エラー出力は/ dev / nullへのリダイレクトする
1. ホームディレクトリ以下以下（サブディレクトリも含む）にあるファイル数を表示する

find ~ -type f  2> /dev/null | wc -l


2. ホームディレクトリ以下（
サブディレクトリも含む）にあるファイルをファイルパスの昇格でソートして上位5件を表示する

find ~ -type f  2> /dev/null | sort | head -n 5


3. ホームディレクトリ以下（サブディレクトリも含む）にあるファイルをファイル3の降順で
ソートして上位5件を表示する

find ~ -type f  2> /dev/null | sort -r | head -n 5


4. / etc / passwdの第1フィールドのユーザ名の降順にソートして上位5件を表示する

cut -d : -f 1 /etc/passwd | sort -r | head -n 5


5. / etc / passwdの第7フィールドのログインシェルから使用しているログインシェルの種類の一覧
を表示する

cut -d : -f 7 /etc/passwd | sort | uniq
