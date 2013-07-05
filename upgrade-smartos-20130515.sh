#!/bin/bash
#
# Fixes SmartOS OS zones for newer versions of SmartOS (i.e. joyent_20130613T201213Z) and
# their associated changes which requires fixing.
#
# Copyright 2013 Jacques Marneweck.  All rights reserved.
#
 
export PS4='[\D{%FT%TZ}] ${BASH_SOURCE}:${LINENO}: ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
set -o xtrace
 
for zone in $(vmadm list -H -o uuid)
do
  echo "Fixing ${zone}"
  echo '{ "resolvers": ["8.8.8.8", "8.8.4.4"] }' | vmadm update ${zone}
  sed -i'' -e '/dns-domain/s/local/siberia.co.za/g' /etc/zones/${zone}.xml
  svcadm -z ${zone} restart mdata:fetch
done
