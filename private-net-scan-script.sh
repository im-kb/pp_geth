#!/bin/bash

RPC_ENDPOINT="http://localhost:8545"

# Get the latest block number
latestBlockNumber=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' -H "Content-Type: application/json" $RPC_ENDPOINT | grep -oP '(?<="result": ")[^"]*')

# Iterate through blocks and print basic block information
for ((i=0; i<=16 ${latestBlockNumber}; i++)); do
    blockInfo=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["0x'"$(printf "%x" $i)"'", true],"id":1}' -H "Content-Type: application/json" $RPC_ENDPOINT)

    echo -e "Block $i Information:\n${blockInfo//$'\\n'/\\n}\n"
done
