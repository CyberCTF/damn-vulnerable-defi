#!/bin/bash
# An anvil node for the player on 8545, and the build report on 8000. The container stops when
# either stops.
busybox httpd -f -p 8000 -h /home/player/www &
anvil --host 0.0.0.0 --port 8545 &
wait -n
