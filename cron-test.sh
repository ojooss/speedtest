#!/bin/bash

#
#  this file intended for LOCAL TEST without docker virtualization overhead
#
#  local installation of speedtest-cli is required
#

speedtest-cli --csv "$@"  >> "./logs/speedtest.$(date +%F).log"
