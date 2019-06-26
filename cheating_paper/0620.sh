リポジトリ下にディレクリ(0620)を作成し、以下のスクリプトを格納
シェル内のコマンドはすべて一般ユーザで実行する


郵便番号検索APIを使用して、引数で「xxxxxxx」の形式で指定した
郵便番号の住所を表示

zipcode=$1
curl http://zip.cgis.biz/csv/zip.php?zn=${zipcode} 2> /dev/null | nkf -wLu


路線/駅名検索APIを使用して、引数で指定した都道府県の路線を一覧表示

pref=$1
curl "http://express.heartrails.com/api/json?method=getLines&prefecture=${pref}" 2> /dev/null | jq '.response.line[]'


路線/駅名検索APIを使用して、引数で指定した路線の駅名を一覧表示

name=$1
curl "http://express.heartrails.com/api/json?method=getStations&line=${name}" 2> /dev/null | jq '.response.station[].name'


引数でしていたURLのページに外部リンク切れが無いかをチェックする

url=$1
curl ${url} | grep -o 'href="[^"]*"' | grep http | sed 's/^href=//' | awk '{print "curl -f",$1,"> /dev/null"}' | tee list | bash -e
