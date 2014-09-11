#!/bin/bash
/opt/monit/bin/monit -c /opt/monit/monitrc quit
sleep 5
/opt/monit/bin/monit -c /opt/monit/monitrc