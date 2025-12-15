#!/usr/bin/env bash
set -x -u -e -o pipefail

apt update
DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
apt install -y software-properties-common g++

mkdir dist

g++ \
    -DSOURCE_CODE="$(cat reverse_tcp_forwarding.cpp | base64 -w 0)" \
    -std=c++20 \
    -Ofast \
    -Wall \
    -Werror \
    -Wfatal-errors \
    -g \
    -fno-sanitize-recover \
    -fsanitize=undefined \
    -static reverse_tcp_forwarding.cpp \
    -o dist/reverse_tcp_forwarding \



#    -DNDEBUG \

