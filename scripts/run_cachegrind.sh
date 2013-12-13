#!/usr/bin/env bash

if [ $# -ne 3 ]; then
    echo "Usage: $0 <prog> <input> <output>"
    exit
fi

prog=$1
input=$2
output=$3

# cache config params
# 4KB 
I1_size=8192
D1_size=8192
LL_size=1048576
L1_n_ways=16
n_ways=16
linesize=32

L1_waysize=$(( D1_size/L1_n_ways ))

while [ $L1_n_ways -gt 0 ] 
do
    echo "test $idx"
    echo "L1_size=$D1_size, associativity=$L1_n_ways, linesize=$linesize"
    #run cachegrind for the cache dimensions
    valgrind --tool=cachegrind --LL=$LL_size,$n_ways,$linesize \
	--I1=$I1_size,$L1_n_ways,$linesize \
	--D1=$D1_size,$L1_n_ways,$linesize \
	$prog $input > $output

#	n_ways=$(( n_ways-1 ))
#	LL_size=$(( n_ways*way_size ))

	L1_n_ways=$(( L1_n_ways-1 ))
	D1_size=$(( L1_n_ways*L1_waysize ))
	I1_size=$(( L1_n_ways*L1_waysize ))

done
