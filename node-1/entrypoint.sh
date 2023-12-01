#!/bin/bash

geth  --unlock 347381d459f2854b6f217be187b6cf6c5f53104a --password /tmp/password \
      --miner.etherbase=347381D459f2854B6F217Be187B6Cf6C5F53104a \
      --mine \
      --nodekeyhex="15ac22adcad37213c7c565810a50f1772291e7b0ce53fb73e7ec2a3c75bc13b5" \
      --bootnodes="enode://af22c29c316ad069cf48a09a4ad5cf04a251b411e45098888d114c6dd7f489a13786620d5953738762afa13711d4ffb3b19aa5de772d8af72f851f7e9c5b164a@geth-bootnode:30303,enode://eec3a5bbc9230397880a24c968c52f1eb09baecd63701f1d039e8a5749c7752c9e505aad6d33397a13094a4705c9efbe283bb4e12665f13f9b4aa0ee0b65ab52@geth-node-2:30305" \
      --networkid=987654321 \
      --port=30304 \
      --nat=none \
      --maxpeers 5 \
      --verbosity 4  \
      --allow-insecure-unlock \
      --http=true \
      --http.addr=0.0.0.0 \
      --http.api="eth,web3,net,admin,personal" \
      --http.port=8546 \
      --http.corsdomain="*" \
      --authrpc.vhosts "*" \
      --graphql.vhosts "*"