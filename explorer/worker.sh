#!/bin/bash

if [ ! -f /root/explorer.conf ]; then
    echo "Setting up the explorer"
    /root/setupexplorer.sh
fi

echo "Running the explorer"
ls
python -m Mce.abe --config /root/explorer.conf