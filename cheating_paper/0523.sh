/etc/passwdファイルからログインシェルとして/bin/bashを
を使用しているユーザのユーザ名のみの一覧をユーザ名の昇順で表示する

cat /etc/passwd | grep '/bin/bash' | cut -d : -f 1 | sort


/etcディレクトリ配下(サブディレクトリも含む)から「network.conf」を検索する

find /etc/ -type f 2> /dev/null | grep '/network.conf'


ホームディレクトリ以下(サブディレクトリも含む)にあるファイルをファイル名の昇順で
ソートして上位5件を表示する
ファイル名の一覧を取得する際、「ls -R」を使用する

ls -R ~ | grep -v '^$' | grep -v ':$' | sort | head -n 5


ホームディレクトリ以下(サブディレクトリも含む)にあるファイルをファイル名の降順で
ソートして上位5件を表示する
ファイル名の一覧を取得する際、「ls -R」を使用する

ls -R ~ | grep -v '^$' | grep -v ':$' | sort -r | head -n 5


/etc ディレクトリ以下のファイルについて「172.16.40.1」の記述があるファイル名の一覧
を表示する

find /etc/ -type f -print0 2> /dev/null |xargs -0 grep -l '172.16.40.1' 2> /dev/null
