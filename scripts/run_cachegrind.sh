#!/usr/bin/env bash

if [ $# -ne 3 ]; then
    echo "Usage: $0 <prog> <input> <output>"
    exit
fi

prog=$1
input=$2
output=$3

# cache config params
# 1MB 
I1_size=512
D1_size=512
LL_size=1048576
L1_n_ways=8
n_ways=16
linesize=64

n_tests=10
idx=0

while [ $idx -le $n_tests ] 
do
    echo "test $idx"
    echo "LL_size=$LL_size, associativity=16, linesize=$linesize"
    #run cachegrind for the cache dimensions
    valgrind --tool=cachegrind --LL=$LL_size,$n_ways,$linesize \
	--I1=$I1_size,$L1_n_ways,$linesize \
	--D1=$D1_size,$L1_n_ways,$linesize \
	$prog $input > $output

    LL_size=$(( LL_size/2 ))
    idx=$(( idx+1 ))
done