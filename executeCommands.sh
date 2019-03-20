#!/bin/bash

docker exec docker-multichain_masternode_1 multichain-cli MyChain create stream RegiaoUm '{"restrict":"onchain"}' '{"teste":"campoDoido"}'

docker exec docker-multichain_masternode_1 multichain-cli MyChain publish RegiaoUm '["key1", "key2", "key3", "key4"]' '{"json":{"i":[1,5],"j":"yes"}}' offchain
