#!/bin/bash

riemann /srv/riemann.config &
sleep 10
riemann-dash /etc/dash.rb
