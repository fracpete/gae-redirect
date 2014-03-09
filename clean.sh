#!/bin/bash
#
# Simply removes some log and progress files left behind by Google's AppEngine.
#
# Author: FracPete (fracpete at waikato dot ac dot nz)
# Version: $Revision: 855 $

# print usage of script
function usage() {
  echo
  echo "Usage: ${0##*/} [-h]"
  echo
  echo "Removes log/progress files left behind by Google's AppEngine."
  echo
  echo "-h"
  echo "   print this help"
  echo
}

# interprete parameters
while getopts ":h" flag
do
   case $flag in
      h) usage
         exit 0
         ;;
      *) usage
         exit 1
         ;;
   esac
done

# perform clean
rm -f bulkloader-log-*
rm -f bulkloader-progress-*
find -name "*~" -delete

