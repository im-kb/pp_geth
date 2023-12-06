#!/bin/bash

RPC_ENDPOINT="http://localhost:8545"

# Get the current date and time in a format suitable for filenames
currentDateTime=$(date +"%Y%m%d_%H%M%S")

# Get the latest block number in hexadecimal format
hexLatestBlockNumber=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' -H "Content-Type: application/json" $RPC_ENDPOINT | jq -r '.result')

# Convert hexadecimal to decimal using Bash arithmetic
latestBlockNumber=$((16#${hexLatestBlockNumber}))

# Define the output file with the current date and time
outputFile="block_info_${currentDateTime}.json"

# Iterate through blocks and print basic block information, saving to the output file
for ((i=0; i<=latestBlockNumber; i++)); do
    hexBlockNumber=$(printf "%x" $i)
    blockInfo=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["0x'"$hexBlockNumber"'", true],"id":1}' -H "Content-Type: application/json" $RPC_ENDPOINT)

    # Prepend the "Block Information" to the JSON result
    blockInfo="{\"BlockId\":\"$i\", ${blockInfo#*\{}"

    # Append the block information to the output file
    echo "$blockInfo" >> "$outputFile"
done

echo "Output saved to: $outputFile"