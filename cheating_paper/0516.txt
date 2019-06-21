「unix1.sh」シェルクリプトをエリアスを「u1」で作成
「u1」がエリアスであることを確認
「u1」エリアスを削除

alias u1='unix1.sh'
type u1
unalias u1


現在のロケールを表示

echo $LANG


現在使用しているシェルのパスを表示

echo $SHELL


コマンド検索パスを表示

echo $PATH


変数「NLS_LANG」に「JAPANESE_JAPAN.AL32UTF8」という値を環境変数として設定
環境変数に正しく設定できていることを確認

export NLS_LANG='JAPANESE_JAPAN.AL32UTF8'
printenv | grep NLS
