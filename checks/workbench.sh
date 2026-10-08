#!/bin/sh
# The workbench built the challenges at image build time (forge build, and Unstoppable's initial
# state test passing), and its anvil node answers JSON-RPC as chain 31337 (0x7a69).
set -u
curl -sS --max-time 20 http://workbench:8000/status.txt 2>/dev/null | grep -q 'Compiler run successful' || { echo "forge build report"; exit 1; }
curl -sS --max-time 20 http://workbench:8000/status.txt 2>/dev/null | grep -q '1 passed; 0 failed' || { echo "initial state test"; exit 1; }
curl -sS --max-time 20 -H 'Content-Type: application/json' \
  -d '{"jsonrpc":"2.0","id":1,"method":"eth_chainId","params":[]}' http://workbench:8545/ 2>/dev/null \
  | grep -q '"result":"0x7a69"' || { echo "anvil eth_chainId"; exit 1; }
echo "Damn Vulnerable DeFi is built and anvil answers as chain 31337"
