#!/bin/bash

geth  --unlock 0xcaa5191965956a87de379f9666c7033faa90232b --password /tmp/password \
      --miner.etherbase=0xcaa5191965956a87de379f9666c7033faa90232b \
      --mine \
      --miner.newpayload-timeout="10s" \
      --rpc.evmtimeout="25s" \
      --rpc.batch-response-max-size=100000000 \
      --rpc.batch-request-limit=5000 \
      --vmdebug=true \
      --nodekeyhex="10ac22adcad37213c7c565810a50f1772291e7b0ce53fb73e7ec2a3c75bc13b5" \
      --bootnodes="enode://af22c29c316ad069cf48a09a4ad5cf04a251b411e45098888d114c6dd7f489a13786620d5953738762afa13711d4ffb3b19aa5de772d8af72f851f7e9c5b164a@geth-bootnode:30303,enode://c038a67f8fcddb4fa7cf544ac4855e7acbf5578e4071ba6d57cd1eb94959fbd172d424dacc107413c59c05ff48756e801af5a5bc47913b8bda830b2b23af59f1@geth-node-1:30304" \
      --networkid=987654321 \
      --port=30305 \
      --nat=none \
      --maxpeers 5 \
      --verbosity 4  \
      --allow-insecure-unlock \
      --http=true \
      --http.addr=0.0.0.0 \
      --http.api="eth,web3,net,admin,personal" \
      --http.port=8547 \
      --http.corsdomain="*" \
      --authrpc.vhosts "*" \
      --graphql.vhosts "*"