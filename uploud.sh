#!/bin/sh

folder=$(date +"%Y%m%d")
fullpath="/media/data/docker/openwrt-ipq807x/public_html/ipq807x/generic/robimarko/$folder"

# echo $fullpath

ssh -p236 andrii@10.10.10.10  <<'ENDSSH'
folder=$(date +"%Y%m%d")
fullpath="/media/data/docker/openwrt-ipq807x/public_html/ipq807x/generic/robimarko/$folder"
[ -d "$fullpath" ] && rm -rf $fullpath
ENDSSH

scp -r -P 236 ./bin/targets/ipq807x/generic andrii@10.10.10.10:$fullpath