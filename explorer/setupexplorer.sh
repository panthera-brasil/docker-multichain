#!/bin/bash -x

echo "Sleep for 10 seconds so the master node has initialised"
sleep 10

echo "Start the chain"
multichaind -daemon -txindex=1 -shrinkdebugfilesize $CHAINNAME@$MASTER_NODE:$NETWORK_PORT -autosubscribe=streams

echo "Sleep for 10 seconds so the slave node has initialised"
sleep 10 

echo "Setup .multichain/$CHAINNAME/multichain.conf"
echo "rpcport=$RPC_PORT" >> /.multichain/$CHAINNAME/multichain.conf

echo "Setup /root/explorer.conf"
cat << EOF > /root/explorer.conf
datadir += [{
        "dirname": "/.multichain/$CHAINNAME",
        "loader": "default",
        "chain": "MultiChain $CHAINNAME",
        "policy": "MultiChain"
        }]
dbtype = MySQLdb
connect-args {"user":"abe","db":"abe","passwd":"PASSWORD","host":"mysqldb","port":3306}
EOF

