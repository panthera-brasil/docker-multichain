#!/bin/bash

registro="$(cat files/registroEmpresaAcme.json)"
metaDados="$(cat files/metaDadoNFAcme.json)"
notaFiscal="$(cat files/notaFiscalAcme.json)"

wait_flux () {
  sleep 1.5
  printf "."
  sleep 0.5
  printf "."
  sleep 0.5
  printf "."
  sleep 0.5
  printf " OK! \n"
}

# printf "Carregando arquivos"
# wait_flux

# printf "Criando Stream de Registro \n"
# txID="$(docker exec docker-multichain_masternode_1 multichain-cli MyChain create stream Registros '{"restrict":"offchain"}' '{"key1":"value1"}')"
# wait_flux
# printf '\n Nome da Stream: Registros | TXID: %s \n' "$txID"

# printf "Registrando uma Empresa \n"
# wait_flux
# txID2="$(docker exec docker-multichain_masternode_1 multichain-cli MyChain publish Registros "CNPJdaEmpresa" \'${registro}\')"
# printf '\n Empresa Registrada | TXID: %s \n' "$txID2"

# printf "Criando nova Stream de Notas Fiscais \n"
# txID3="$(docker exec docker-multichain_masternode_1 multichain-cli MyChain create stream Nickelodeon '{"restrict":"onchain"}' '{"key1":"value1"}')"
# wait_flux
# printf '\n Nome da Stream: Nickelodeon | TXID: %s \n' "$txID3"

# printf "Registrando uma Nota Fiscal Distribuída \n"
# txID4="$(docker exec docker-multichain_masternode_1 multichain-cli MyChain publish Nickelodeon \'${metaDados}\' \'${notaFiscal}\' offchain)"
# wait_flux
# printf '\n Nota Criada | TXID: %s \n' "$txID4"