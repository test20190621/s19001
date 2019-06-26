1. findを使用して/ var / logディレクトリ以下で拡張子が「log」ファイルの一覧を検索

find /var/log -name '*.log'


2. findを使って/ homeディレクトリ以下で「.vim」ディレクトリを検索

find /home -type d -name '.vim'


3. locateを使用してファイル名に「syslog」を含むファイルの一覧を検索

locate -b syslog


4. manを使用して「date」コマンドのマニュアルを表示

man date


5. whichを使用して「unix1.sh」シェルスクリプトを探す

which unix1.sh
