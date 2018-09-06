#!/bin/sh

echo "Run VVP"
if [ "$(ls -A $1)" ]; then
   ls $1
   cd /src/valid_script/ice_validator/
   pytest /src/valid_script/ice_validator/tests --cache-clear --runxfail --template-dir=$1 --report-format=html
else
   echo "no Files found"
   exit 1
fi
