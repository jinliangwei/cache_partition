#!/usr/bin/env bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <context-config> <mem-stats>"
    exit
fi

ctx_config=$1
mem_stats_out=$2

./multi2sim-4.2/bin/m2s \
    --x86-sim detailed --x86-config m2s-configs/x86_config.ini \
    --ctx-config $ctx_config \
    --mem-config m2s-configs/mem_config.ini \
    --mem-report $mem_stats_out