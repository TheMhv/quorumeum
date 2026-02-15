#!/usr/bin/env bash
#
# Copyright (c) 2019-present The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C.UTF-8

export CONTAINER_NAME=quorumeum
export CI_IMAGE_NAME_TAG="mirror.gcr.io/ubuntu:24.04"
export APT_LLVM_V="21"
export PACKAGES="systemtap-sdt-dev clang-${APT_LLVM_V} llvm-${APT_LLVM_V} libclang-rt-${APT_LLVM_V}-dev python3-zmq libevent-dev libboost-dev libsqlite3-dev ${BPFCC_PACKAGE} libcapnp-dev capnproto python3-pip"
export PIP_PACKAGES="--break-system-packages pycapnp"
export NO_DEPENDS=1
export GOAL="install"
export CI_LIMIT_STACK_SIZE=1
export BITCOIN_CONFIG="\
 -DREDUCE_EXPORTS=ON  \
 -DWITH_USDT=OFF -DWITH_ZMQ=OFF -DBUILD_GUI=OFF \
 -DCMAKE_C_COMPILER=clang \
 -DCMAKE_CXX_COMPILER=clang++ \
 -DAPPEND_CXXFLAGS='-std=c++23' \
 -DAPPEND_CPPFLAGS='-DARENA_DEBUG -DDEBUG_LOCKORDER' \
"

export RUN_UNIT_TESTS=false
