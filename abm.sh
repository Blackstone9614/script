#!/bin/sh

#引数がいくつあるかをを確認

if [ $# -eq 2 ]; then
 URL=$1
 FILENAME=$2
 GASITU="1080p"
 HEIRETU="1"
elif [ $# -eq 3 ]; then
 URL=$1
 FILENAME=$2
 GASITU=$3
 HEIRETU="1"
elif [ $# -eq 4 ]; then
 URL=$1
 FILENAME=$2
 GASITU=$3
 HEIRETU=$4
else
 echo "usage : abm.sh [Url] [outfilename] ([画質]) ([並列DL数])"
 exit 1;
fi

#ファイル出力先の設定
OUTFILEPATH=$HOME/storage/movies
echo "画質は、${GASITU}です"
echo "並列ダウンロード数は、${HEIRETU}です"
#
# streamlink
#

streamlink --default-stream "${GASITU}" \
 -4 \
 --retry-max 10 \
 -l trace \
 --stream-segment-attempts 10000 \
 --stream-segment-thread "${HEIRETU}" \
 --stream-segment-timeout 100000 \
 --stream-timeout 100000 \
 --url "${URL}" \
 --output "${OUTFILEPATH}/${FILENAME}.ts"

exit 0;
