リポジトリ下にディレクリ(0604)を作成し、以下のスクリプトを格納
シェル内のコマンドはすべて一般ユーザで実行する


キーボードからファイルのパスを１つ入力して、その容量を表示
但し、入力したパスが通常のファイルでない場合以下のエラーメッセージを表示
入力したファイルパス: 通常のファイルではありません

if [ -f "$1" ]; then
    # duでファイル容量を求める
    du "$1"
else
    # エラーメッセージ
    echo "${1}: 通常のファイルではありません"
fi


キーボードからファイルのパスを複数入力して、その容量を表示
ファイル名のみ: ファイル容量
但し、入力したパスが通常のファイルでない場合以下のエラーメッセージを表示
入力したファイルパス: 通常のファイルではありません

for file in "$@"
do
    if [ -f "$1" ]; then
        du "$file"
    else
        # エラーメッセージ
        echo "${file}: 通常のファイルではありません"
    fi
done


指定したディレクトリパス(サブディレクトリは含まない)の実行可能ファイルの一覧表示
但し、入力したパスがディレクトリでない場合以下のエラーメッセージを表示
入力したパス: ディレクトリではありません

if [ -d "$1" ]; then
    # ディレクトリ内のファイルが実行可能ファイルかチェックして
    # 実行可能ファイルであれば表示
    #for file in $(ls "$1")
    for file in $(find "$1" -maxdepth 1 -type f)
    do
        # fileが実行可能ファイルであれば表示
        #if [ -x "${1}/${file}" ] && [ ! -d "${1}/${file}" ]; then
        if [ -x "$file" ]; then
            #echo "$file"
            #echo 'basename "$file"'
            echo $(basename "$file")
        fi
    done
else
    # エラーメッセージ
    echo "${1}: ディレクトリではありません"
fi


指定したディレクトリパス(サブディレクトリは含まない)の読み込みができないファイルの一覧表示
但し、入力したパスがディレクトリでない場合以下のエラーメッセージを表示
入力したパス: ディレクトリではありません

if [ -d "$1" ]; then
    for file in $(find "$1" -maxdepth 1 -type f)
    do
        if [ ! -r "$file" ]; then
            echo $(basename "$file")
        fi
    done
else
    echo "${1}: ディレクトリではありません"
fi


unix1.shの改造、case文を利用してgit add/commit/pushを個別に
実行できるようにする
git add -i
git commit
git push
スクリプトの終了

#!/bin/bash

function cont() {
    echo -n 'continue?(y/n)'
    read yesno
    if [ $yesno = 'n' ]; then
        echo 'end...'
        exit
    fi
    echo 'continue...'
}
#!/bin/bash
cd $HOME/rep/unix1/

while :
do
    #git add/commit/pushの選択画面
    echo '1) git add -i'
    echo '2) git commit'
    echo '3) git push'
    echo '*) exit'
    echo -n 'select?(1/2/3/*): '
    read select
    case "$select" in
        # gir add -i 選択
        1)
            git add -i
            git status
            ;;
            #git commit 選択
        2)
            echo -n 'comment: '
            read comment
            git comment -m "$comment"
            git log --oneline
            ;;
            # git push選択
        3)
            git push
            ;;
        *)
            echo "end..."
            exit
            ;;
    esac
done
