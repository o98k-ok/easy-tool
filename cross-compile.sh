#!/bin/bash


#CCO_ENABLED
#GOOS
#GOARCH
# args[1] osname 
# args[2] archname

OsSet=("darwin", "linux", "windows", "freebsd")
ArchSet=("amd64", "arm64", "386")

dstOs=$1
dstArch=$2
filename=$3
dstBinaryName=binary-$dstOs-$dstArch

cmdFmt="./cross-compile.sh darwin amd64 main.go"

if [[ ! "${OsSet[@]}" =~ "$dstOs" ]]; then
 echo "$dstOs is invalid, dest os is [${OsSet[@]}]"
 echo "sample cmd: $cmdFmt"
 exit -1
fi

if [[ ! "${ArchSet[@]}" =~ "$dstArch" ]]; then
 echo "$dstArch is invalid, dest arch is [${ArchSet[@]}]"
 echo "sample cmd: $cmdFmt"
 exit -1
fi

if [ -z "$filename" ]; then
 echo "can't get valid filename"
 echo "sample cmd: $cmdFmt"
 exit -1
fi


echo "start compile $filename os=$dstOs arch=$dstArch ..."
CCO_ENABLED=0 GOOS=$dstOs GOARCH=$dstArch go build -o $dstBinaryName $filename
