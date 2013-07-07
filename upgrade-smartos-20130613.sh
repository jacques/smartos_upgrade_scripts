#!/bin/bash
#
# Fixes SmartOS OS zones for newer versions of SmartOS (i.e. joyent_20130613T201213Z) and
# their associated changes which requires fixing.
#
# Copyright 2013 Jacques Marneweck.  All rights reserved.
#

export PS4='[\D{%FT%TZ}] ${BASH_SOURCE}:${LINENO}: ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
set -o xtrace

ZONENAME=$(zonename)
if [[ $ZONENAME != "global" ]]; then
  echo "This script needs to run from the global zone."
  exit 1
fi

#
# Fix NTP (where it is in maintenance)
#
if [[ $(svcs -Ho state ntp) == "maintenance" ]]; then
  ntpdate 0.pool.ntp.org
  svcadm clear ntp
fi
