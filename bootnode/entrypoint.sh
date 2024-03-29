#!/bin/bash

geth --unlock 0xC1C171Aa00656c46852A867061bA439C6b4641F6 --password /tmp/password \
      --miner.etherbase=0xC1C171Aa00656c46852A867061bA439C6b4641F6 \
      --mine \
      --miner.newpayload-timeout="10s" \
      --rpc.evmtimeout="25s" \
      --rpc.batch-response-max-size=100000000 \
      --rpc.batch-request-limit=5000 \
      --vmdebug=true \
      --nodekeyhex="b0ac22adcad37213c7c565810a50f1772291e7b0ce53fb73e7ec2a3c75bc13b5" \
      --nodiscover \
      --networkid=987654321 \
      --port=30303 \
      --nat=none \
      --maxpeers 5 \
      --verbosity 4 \
      --allow-insecure-unlock \
      --http=true \
      --http.addr=0.0.0.0 \
      --http.api="eth,web3,net,admin,personal" \
      --http.port=8545 \
      --http.corsdomain="*" \
      --http.vhosts="*"
