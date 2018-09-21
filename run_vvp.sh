#!/bin/sh

ICE_VALIDATOR_PATH=/src/valid_script/ice_validator
echo "Run VVP"
if [ "$(ls -A $1)" ]; then
  count=`ls -1 *.env 2>/dev/null | wc -l`
  # check there is at least an env file
  if [ $count != 0 ]; then
      ls $1
      cd $ICE_VALIDATOR_PATH
      pytest $ICE_VALIDATOR_PATH/tests --cache-clear --runxfail --template-dir=$1 --report-format=html
      res=$?
      mv $ICE_VALIDATOR_PATH/output/* /
      exit $res
  else
    echo "Empty dir, skip"
else
   echo "no Files found"
   exit 1
fi
