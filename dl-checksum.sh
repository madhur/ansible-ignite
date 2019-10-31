#!/usr/bin/env sh
DIR=~/Downloads
PLATFORM=linux-x86_64
MIRROR=https://archive.apache.org/dist/ignite

dl_ver() {
    local ver=$1
    local url=$MIRROR/$ver/apache-ignite-${ver}-bin.zip.sha512

    printf "  # %s\n" $url
    printf "  '%s': sha512:%s\n" $ver $(curl -sSL $url | awk '{print $1}')
}

#dl_ver ${1:-2.7.0}
dl_ver 2.7.5
dl_ver 2.7.6

