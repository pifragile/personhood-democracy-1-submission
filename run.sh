#!/bin/bash
printf "RUNNING DEMOCRACY SIMULATION...\n\n"
cd ../encointer-node/client
source ../../env/bin/activate

python -u e2e_tests.py

printf "\n\nDEMOCRACY SIMULATION SUCCESS\n\n"
