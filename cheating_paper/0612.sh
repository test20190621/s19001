リポジトリ下にディレクリ(0612)を作成し、以下のスクリプトを格納
シェル内のコマンドはすべて一般ユーザで実行する


060402.shのスクリプトで引数が指定されていない場合にヘルプを表示
ファイル名は変更しない
使い方: 060402.sh FILEPATH...
FILEPATHで指定したファイルの容量を表示
FILEPATH - 容量を求めるファイルのパスを指定、複数指定可

#!/bin/bash

usage()
{
    local script_name=$(basename "$0")
    cat << END
使い方: 060402.sh FILEPATH...
FILEPATHで指定したファイルの容量を表示
FILEPATH - 容量を求めるファイルのパスを指定、複数指定可
END
}

for file in "$@"
do
    if [ -f "$file" ]; then
        du "$file"
    else
        # エラーメッセージ
        echo "${file}: 通常のファイルではありません"
    fi
done

if [ "$#" -eq 0 ]; then
    usage
    exit 1
fi


060403.shのスクリプトで引数が指定されていない場合にヘルプを表示
ファイル名は変更しない
使い方: 060403.sh DIRPATH
DIRPATHで指定したディレクトリ下の実行可能ファイルの一覧表示
DIRPATH - 実行可能ファイルの一覧表示を行うディレクトリパスを指定


#!/bin/bash

usage()
{
    local script_name=$(basename "$0")
    cat << END
使い方: 060403.sh DIRPATH
DIRPATHで指定したディレクトリ下の実行可能ファイルの一覧表示
DIRPATH - 実行可能ファイルの一覧表示を行うディレクトリパスを指定
END
}
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

if [ "$#" -eq 0 ]; then
    usage
    exit 1
fi


060404.shのスクリプトで引数が指定されていない場合にヘルプを表示
ファイル名は変更しない
使い方: 060404.sh DIRPATH
DIRPATHで指定したディレクトリ下の読み取り不可ファイルの一覧表示
DIRPATH - 読み取り不可ファイルの一覧表示を行うディレクトリパスを指定


#!/bin/bash

usage()
{
    local script_name=$(basename "$0")
    cat << END
使い方: 060404.sh DIRPATH
DIRPATHで指定したディレクトリ下の読み取り不可ファイルの一覧表示
DIRPATH - 読み取り不可ファイルの一覧表示を行うディレクトリパスを指定
END
}

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

if [ "$#" -eq 0 ]; then
    usage
    exit 1
fi
