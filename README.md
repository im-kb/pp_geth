docker compose build

docker compose up -d

https://geth.ethereum.org/docs/fundamentals/command-line-options

https://geth.ethereum.org/docs/fundamentals/private-network


--verbosity value    (default: 3)

Logging verbosity: 0=silent, 1=error, 2=warn, 3=info, 4=debug, 5=detail


Other useful commands and information (to be described :) )

BOOTNODE

When a new node joins the Ethereum network it needs to connect to nodes that are already on the network in order to then discover new peers.
These entry points into the Ethereum network are called bootnodes. Clients usually have a list of bootnodes hardcoded into them.
These bootnodes are typically run by the Ethereum Foundation's devops team or client teams themselves.
Note that bootnodes are not the same as static nodes. Static nodes are called over and over again,
whereas bootnodes are only called upon if there are not enough peers to connect to and a node needs to bootstrap some new connections

The nodekey file is used to generate the Geth enode which is kind of the id of each node in Ethereum network.
nodekeyhex - must be hardcoded to generate same enode (node id) each image build in order to allow other nodes to hardcode the node address

Go based ethereum nodes can mine with CPU and GPU. On a private deployment you can mine with CPU.

. In private networks for development or testing purposes, specify at least one bootnode.
. Bootnodes and static nodes are parallel methods for finding peers.

Bootnodes are the nodes which provide information about other peers, txns, blocks. Once that information is received,
bootnode does not need to be online. But bootnodes are always kept online,
because new nodes keep coming up and require some of this information.

Bootnode can be validator nodes. It does not matter whether bootnode is validator or non validator.
For all other nodes, it is just some node which can be used to get information of other nodes and get previous blockchain data.
NOTE: Since the validator node needs to expose its enode address (enode://pubkey1@ip1:port1) and thus the validator node's IP address in order to be a Bootnode,
having validator nodes serve as Bootnodes (and advertising this) makes it easier for network attackers (DDOS) to target validator nodes.

The P2P protocol requires that you indicate at least a bootnode from which your discovery will start.
Bootnode is a venue for new nodes otherwise they can't know where to start searching for peers.

To encode the signer addresses in extradata, concatenate 32 zero bytes, all signer addresses and 65 further zero bytes.
The result of this concatenation is then used as the value accompanying the extradata key in genesis.json.
In the example below, extradata contains a single initial signer address, 0x7df9a875a174b3bc565e6424a0050ebc1b2d1d82.

Etherbase, also called coinbase, is the public key of an Ether account,


nc -zv localhost 30304

cat ~/.ethereum/geth/nodekey
cd ~/.ethereum/keystore/

### [Example calls to rpc rest api]:
curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_version","params":[],"id":1}' -H "Content-Type: application/json" "http://localhost:8545"

curl -s -X POST --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' -H "Content-Type: application/json" "http://localhost:8545"


## [Geth Java Script Console](#console)
Run the following command in the container shell to access the Geth Java Script Console:
```
geth attach
```
Now, within the geth JavaScript console following commands may come in handy:

geth account list | awk '/Account #0:/ {print $3}' | sed 's/{\(.*\)}/0x\1/'

eth.getBalance("C1C171Aa00656c46852A867061bA439C6b4641F6")
eth.getBalance("347381d459f2854b6f217be187b6cf6c5f53104a")
eth.getBalance("caa5191965956a87de379f9666c7033faa90232b")



eth.sendTransaction({from: "caa5191965956a87de379f9666c7033faa90232b", to: "C1C171Aa00656c46852A867061bA439C6b4641F6", value: web3.toWei(1, "ether")})


admin.peers
admin.nodeInfo
eth.getBlock(0).hash
eth.getBlock("latest")
list sealers clique.getSigners()
list propositions: clique.proposals
discard a proposition: clique.discard("0x1234234234234")
add a new sealer: clique.propose("0x8132ac3481ff1c3e871d4ea34b4069edb5ed0f99", true)
remove a sealer: clique.propose("0x8132ac3481ff1c3e871d4ea34b4069edb5ed0f99", false)
web3.personal.unlockAccount('0d1915640f9449305b5ca966892ff4f522833b85', 'test')

admin.addPeer("enode://c038a67f8fcddb4fa7cf544ac4855e7acbf5578e4071ba6d57cd1eb94959fbd172d424dacc107413c59c05ff48756e801af5a5bc47913b8bda830b2b23af59f1@geth-bootnode:30303")
admin.addPeer("enode://c038a67f8fcddb4fa7cf544ac4855e7acbf5578e4071ba6d57cd1eb94959fbd172d424dacc107413c59c05ff48756e801af5a5bc47913b8bda830b2b23af59f1@geth-node-1:30304")
admin.addPeer("enode://eec3a5bbc9230397880a24c968c52f1eb09baecd63701f1d039e8a5749c7752c9e505aad6d33397a13094a4705c9efbe283bb4e12665f13f9b4aa0ee0b65ab52@geth-node-2:30305")


instance.isAdmin.sendTransaction('0xC1C171Aa00656c46852A867061bA439C6b4641F6',{ from: eth.accounts[0], gas: 1000000 });