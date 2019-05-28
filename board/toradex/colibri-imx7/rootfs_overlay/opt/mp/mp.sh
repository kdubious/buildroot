#!/bin/bash
# The MP setup

# stop Roon
echo `systemctl stop roon.service`
# This script moves all static files into their proper places
cp -R /srv/http/_files/* /

# probably need this
# systemctl daemon-reload
echo "ok"