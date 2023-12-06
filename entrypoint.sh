#!/bin/bash


function parse_args() {
    while [[ $# -gt 0 ]]
    do
        case $1 in
        --run-untagged)
            RUN_UNTAGGED="true"
            shift
            ;;
        --vm-runner)
            local VM_RUNNER="true"
            shift
            ;;
        -*|--*)
            printf "[ERROR] parse_args() Unknown option ${1}.\n" 1>&2
            exit 1
            ;;
        *)
            shift
            ;;
        esac
    done
}


function main() {
    parse_args "${@}"

    geth init ./genesis.json
    echo ${ACCOUNT_PASSWORD} > ./password
    geth account import --password ./password ./node.private.key

    geth --unlock ${WALLET_ADDRESS} --password ./password \
        --miner.etherbase=${WALLET_ADDRESS} \
        --mine \
        --miner.newpayload-timeout="10s" \
        --rpc.evmtimeout="25s" \
        --rpc.batch-response-max-size=100000000 \
        --rpc.batch-request-limit=5000 \
        --vmdebug=true \
        --nodekeyhex="${NODE_KEY_HEX}" \
        --networkid=${ETH_NETWORK_ID} \
        --netrestrict="${ACCEPT_NETWORK_CIDR}" \
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
        --http.vhosts="*" \
        "${GETH_CLI_ARGS}"
}

main "${@}"
