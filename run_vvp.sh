#!/bin/sh

ICE_VALIDATOR_PATH=/src/valid_script/ice_validator
echo "Run VVP"
mkdir -p /output
if [ "$(ls -A $1)" ]; then
  count=`ls -1 $1/*.env 2>/dev/null | wc -l`
  # check there is at least an env file
  if [ $count != 0 ]; then
      ls $1
      cd $ICE_VALIDATOR_PATH
      pytest $ICE_VALIDATOR_PATH/tests --cache-clear --runxfail --template-dir=$1 --html=/output/report.html
      res=$?
      if [ $res -ne 0 ]; then
          echo $res > /output/status
      fi
      exit $res
  else
    echo "Empty dir, skip"
  fi
else
   echo "no Files found"
   echo "1" > /output/status
   exit 1
fi

