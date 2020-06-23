#!/bin/bash

if [ -z $1 ]
then
  test="none"
elif [ -n $1 ]
then
# otherwise make first arg as test
  test=$1
fi

# use case statement to make decision for test
echo ""
echo "---------------------------------"
echo "run rocm-smi to monitor gpu usage"
echo "---------------------------------"
echo ""
case $test in
   "none") echo "No test selected, please enter $0 [dgemm|sgemm|hgemm]";;
   "dgemm") echo "Running $1 ..."; /opt/rocm/rvs/rvs -c /opt/rocm/rvs/conf/Artus_dgemm_gst.conf -d 1;;
   "sgemm") echo "Running $1 ..."; /opt/rocm/rvs/rvs -c /opt/rocm/rvs/conf/Artus_sgemm_gst.conf -d 1;;
   "hgemm") echo "Running $1 ..."; /opt/rocm/rvs/rvs -c /opt/rocm/rvs/conf/Artus_hgemm_gst.conf -d 1;;
   *) echo "Sorry, No test selected, please enter $0 [dgemm|sgemm|hgemm]";;
esac
