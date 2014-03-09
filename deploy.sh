#!/bin/bash
#
# Deploys an application to Google's AppEngine.
#
# Author: FracPete (fracpete at waikato dot ac dot nz)
# Version: $Revision: 864 $

# print usage of script
function usage() {
  echo
  echo "Usage: ${0##*/} [-g dir] [-p bin] [-r] [-c] [-v] [-h]"
  echo
  echo "Deploys an application to Google's AppEngine."
  echo 
  echo "-g <dir>"
  echo "   Google Appengine root directory, default: $GAE_DEFAULT"
  echo "-p <bin>"
  echo "   Path to python 2.7 executable, default: $PY_BIN_DEFAULT"
  echo "-r"
  echo "   perform rollback"
  echo "-c"
  echo "   disable use of cookies"
  echo "-v"
  echo "   verbose output, i.e., command-lines used"
  echo "-h"
  echo "   print this help"
  echo
}

# set defaults
PY_BIN_DEFAULT="/usr/bin/python2.7"
PY_BIN=$PY_BIN_DEFAULT
GAE_DEFAULT="/usr/local/google_appengine-1.8.2"
GAE=$GAE_DEFAULT
ROLLBACK="no"
NO_COOKIES=""
VERBOSE="no"

# interprete parameters
while getopts ":hvg:p:rc" flag
do
   case $flag in
      g) GAE=$OPTARG
         ;;
      p) PY_BIN=$OPTARG
         ;;
      c) NO_COOKIES="--no_cookies"
         ;;
      r) ROLLBACK="yes"
         ;;
      v) VERBOSE="yes"
         ;;
      h) usage
         exit 0
         ;;
      *) usage
         exit 1
         ;;
   esac
done

# determine google appengine root directory
if [ ! -d $GAE ]
then
  echo
  echo "Google Appengine directory invalid: $GAE"
  echo
  exit 2
fi

${0%/*}/clean.sh

if [ "$ROLLBACK" = "yes" ]
then
  CMD="$PY_BIN $GAE/appcfg.py --oauth2 --noauth_local_webserver $NO_COOKIES rollback ."
else
  CMD="$PY_BIN $GAE/appcfg.py --oauth2 --noauth_local_webserver $NO_COOKIES update . $ADDITIONAL"
fi

if [ "$VERBOSE" = "yes" ]
then
  echo $CMD
fi

$CMD

