#!/bin/sh

#これはffmpegでtsファイルをmp4ファイルにコンテナ替えして元のtsを削除するスクリプトです

#引数をどうか確認
#引数が１つの時⇒ファイル名を同じでコンテナ替え
#引数が２つの時⇒ファイル名を変えてコンテナ替え
if [ $# -eq 1 ]; then
 INPUTFILE=$1
 OUTPUTFILE=$1
elif [ $# -eq 2 ]; then
 INPUTFILE=$1
 OUTPUTILE=$2
else
 echo "使い方…fm4.sh [IN] ([OUT])"
 exit 1;
fi

#出力・入力ディレクトリの指定
FILEPATH=$HOME/storage/movies

#ffmpegでのコンテナ替え
#
ffmpeg -i "${FILEPATH}/${INPUTFILE}.ts" \
 -c copy \
 -movflags faststart \
 "${FILEPATH}/${OUTPUTFILE}.mp4"

#tsファイルの削除
rm "${FILEPATH}/${INPUTFILE}.ts"

exit 0;
