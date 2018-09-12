#!/bin/sh

ICE_VALIDATOR_PATH=/src/valid_script/ice_validator/
echo "Run VVP"
if [ "$(ls -A $1)" ]; then
   ls $1
   cd $ICE_VALIDATOR_PATH
   pytest $ICE_VALIDATOR_PATH/tests --cache-clear --runxfail --template-dir=$1 --report-format=html
   res=$?
   mv output /
   exit $res
else
   echo "no Files found"
   exit 1
fi
