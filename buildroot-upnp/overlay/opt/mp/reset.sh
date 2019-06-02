#!/bin/sh

if gpiomon --num-events=1 --rising-edge gpiochip0 1 | grep 'event' > /dev/null;$
    #TODO: reset to DHCP
    touch /opt/mp/done
fi
