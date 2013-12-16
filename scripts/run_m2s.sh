#!/usr/bin/env bash

if [ $# -ne 3 ]; then
    echo "Usage: $0 <context-config> <max-inst> <mem-stats>"
    exit
fi

max_inst=$1
ctx_config=$2
mem_stats_out=$3

./dev-multi2sim-4.2/bin/m2s \
    --x86-sim detailed --x86-max-inst $max_inst \
	--x86-config m2s-configs/x86_config.ini \
    --ctx-config $ctx_config \
    --mem-config m2s-configs/mem_config.ini \
    --mem-report $mem_stats_out
