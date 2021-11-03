#!/bin/bash

TMP_FILE="/tmp/myip.txt"
#You may also use DNS lookup if you are using a Dynamic DNS service:
#myip=$(dig mydomain.no-ip.com +short)
myip=$(curl -s http://whatismyip.akamai.com/)
myoldip=`cat $TMP_FILE`

if ! [[ $myip == $myoldip ]]; then
        logger external IP address has changed, fixing asterisk: sip_general_custom.conf
        echo $myip > $TMP_FILE
        echo externhost=$myip > /etc/asterisk/sip_general_custom.conf
        /usr/sbin/asterisk -rx "sip reload"
fi
