#!/bin/bash

# if use_proxy from env is set to true, then set proxy
if [ "${use_proxy}" = true ]; then
    # check whether proxychains4.conf exists
    if [ -f /root/proxychains4.conf ]; then
        proxychains4 -q -f /root/proxychains4.conf dero --wallet-address=dero1qyfl5p0etumw44zfeahjue4qdkhvm5vsjyru0t8vggtmau06d4a9gqq9dwqsl --daemon-rpc-address=dero.rabidmining.com:10300 --debug
    else
        echo "Proxychains4.conf not found, exit"
        exit 1
    fi
else
    dero --wallet-address=dero1qyfl5p0etumw44zfeahjue4qdkhvm5vsjyru0t8vggtmau06d4a9gqq9dwqsl --daemon-rpc-address=dero.rabidmining.com:10300 --debug
fi
