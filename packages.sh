#!/bin/bash

###########################################################
# Prereqs  
# - Ubuntu 18.04                                               
# - kcbench
#
##########################################################

if [ -z $1 ]
then
  test="none"
elif [ -n $1 ]
then
# otherwise make first arg as  test
  test=$1
fi


MIN="	hwloc 
	htop 
	sensors 
"	

echo $MIN

# use case statement to make decision 
echo ""
case $test in
   "none")
	echo "--------------------------------------------------------------------"
	echo "No test selected, please enter $0 [min|max|lamp|...]"
	echo "--------------------------------------------------------------------"
	echo ""
	;;
   "min"|"MIN")
	echo "Installing $1 ..."
	apt install $MIN
	;;
   "halfcpu"|"HALFCPU")
	echo "Stressing $1 ..."
	/opt/kcbench/kcbench -j $halfcores &
	;;
   "gpu"|"GPU")
	echo "Stressing $1 (dgemm)..."
	/opt/rocm/rvs/rvs -c /opt/rocm/rvs/conf/Artus_dgemm_gst.conf -d 1
	;;
   "halfgpu"|"HALFGPU")
	echo "Stressing $1 (sgemm)..."
	/opt/rocm/rvs/rvs -c /opt/rocm/rvs/conf/Artus_sgemm_gst.conf -d 1
	;;
   "both") 
	echo "Stressing $1 CPU/GPU..."
	/opt/kcbench/kcbench -j $cores&
	/opt/rocm/rvs/rvs -c /opt/rocm/rvs/conf/Artus_dgemm_gst.conf -d 1
	;;
   "halfboth") 
	echo "Stressing $1 Half CPU/GPU..."
	/opt/kcbench/kcbench -j $halfcores&
	/opt/rocm/rvs/rvs -c /opt/rocm/rvs/conf/Artus_sgemm_gst.conf -d 1
	;;
   *) 
	echo "--------------------------------------------------------------------"
	echo "Invalid selection, please enter $0 [cpu|gpu|halfcpu|halfgpu|halfboth|both]"
	echo "--------------------------------------------------------------------"
	echo ""
	;;
esac
