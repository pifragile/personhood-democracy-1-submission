#!/bin/bash
printf "RUNNING DEMOCRACY UNIT TESTS...\n\n"
cd encointer-pallets/
cargo test --package pallet-encointer-democracy --lib

printf "\n\nRUNNING DEMOCRACY SIMULATION...\n\n"
cd ../encointer-node/client
source ../../env/bin/activate

python -u e2e_tests.py
