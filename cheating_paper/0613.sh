リポジトリ下にディレクリ(0613)を作成し、以下のスクリプトを格納
シェル内のコマンドはすべて一般ユーザで実行する


ログインユーザのホームディレクトリ以下(サブディレクトリを含む)
をバックアップするスクリプト(backup.sh)
tarコマンドでアーカイブ
gzipで圧縮
/tmpディレクトリに作成
アーカイブファイル名: home-yyyymmdd.tar.gz(yyyymmddは作成年月日)
ホームディレクトリ直下のアーカイブから除外するファイル/ディレクトリ
一覧(ex.cnf)を読み込む

tar czf /tmp/home-`date '+%Y%m%d'`.tar.gz -X ~/ex.cnf "$HOME"