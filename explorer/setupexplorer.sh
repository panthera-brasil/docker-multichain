#!/bin/bash -x

echo "Sleep for 10 seconds so the master node has initialised"
sleep 10

echo "Start the chain"
multichaind -daemon -txindex=1 -shrinkdebugfilesize $CHAINNAME@$MASTER_NODE:$NETWORK_PORT -autosubscribe=streams

echo "Sleep for 10 seconds so the slave node has initialised"
sleep 10

echo "Setup /root/.multichain/$CHAINNAME/multichain.conf"
echo "rpcport=$RPC_PORT" >> /root/.multichain/$CHAINNAME/multichain.conf

echo "Setup /root/explorer.conf"
cat << EOF > /root/explorer.conf
datadir += [{
        "dirname": "~/.multichain/$CHAINNAME",
        "loader": "default",
        "chain": "MultiChain $CHAINNAME",
        "policy": "MultiChain"
        }]
dbtype = MySQLdb
connect-args {"user":"abe","db":"abe","passwd":"PASSWORD","host":"mysqldb","port":3306}
EOF

python -m Mce.abe --config /root/explorer.conf --commit-bytes 100000 --no-serve  --recent_tx_interval_ms=2000 --catch_up_tx_interval_secs=10
python -m Mce.abe --config /root/explorer.conf --recent_tx_interval_ms=2000 --catch_up_tx_interval_secs=10
