#!/bin/bash

grep -e 'WW' -e 'II' /var/log/anaconda/X.log | sed 's/WW/Warning:/' | sed 's/II/Information:/' > full.log

cat full.log