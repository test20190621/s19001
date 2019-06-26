/etc/passwdファイルから現在のログインユーザの情報を表示
現在のログインユーザはシェル変数「USER」を参照

cat /etc/passwd | grep $USER


/etc/servicesファイルから「80/tcp」の行を抽出する

 cat /etc/services | awk '$1 ~ /^http$/{print $0}'


ホームディレクトリ以下(サブディレクトリも含む)にある
ファイル及びディレクトリの数をそれぞれ表示する

find ~ -type f | wc -l
find ~ -type d | wc -l


/varディレクトリ以下(サブディレクトリも含む)にあるファイルの容量の多い
上位5件を表示する

sudo find /var -type f -exec du \{\} \; | sort -nr | head -n 5


/varディレクトリ以下(サブディレクトリも含む)にあるファイルの容量が0
のファイルをすべて表示する

sudo find /var -type f | xargs sudo du | awk '$1 ~ /^0$/{print $0}'
