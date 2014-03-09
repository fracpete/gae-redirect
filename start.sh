#!/bin/bash
#
# Starts the developer appserver.
#
# Author: FracPete (fracpete at waikato dot ac dot nz)
# Version: $Revision: 855 $

# print usage of script
function usage() {
  echo
  echo "Usage: ${0##*/} [-g dir] [-p bin] [-H host] [-P port] [-h]"
  echo
  echo "Starts the developer appserver."
  echo 
  echo "-g <dir>"
  echo "   Google Appengine root directory, default: $GAE_DEFAULT"
  echo "-p <bin>"
  echo "   Path to python 2.7 executable, default: $PY_BIN_DEFAULT"
  echo "-H <host>"
  echo "   The host to bind to, default: $HOST_DEFAULT"
  echo "-P <port>"
  echo "   The port to use for serving the content, default: $PORT_DEFAULT"
  echo "-h"
  echo "   print this help"
  echo
}

# set defaults
PY_BIN_DEFAULT="/usr/bin/python2.7"
PY_BIN=$PY_BIN_DEFAULT
GAE_DEFAULT="/usr/local/google_appengine-1.8.2"
GAE=$GAE_DEFAULT
HOST_DEFAULT="localhost"
HOST=$HOST_DEFAULT
PORT_DEFAULT="8080"
PORT=$PORT_DEFAULT

# interprete parameters
while getopts ":hg:p:H:P:" flag
do
   case $flag in
      g) GAE=$OPTARG
         ;;
      p) PY_BIN=$OPTARG
         ;;
      H) HOST=$OPTARG
         ;;
      P) PORT=$OPTARG
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

echo "Starting dev appserver $HOST:$PORT"
$PY_BIN $GAE/dev_appserver.py --host=$HOST --port $PORT .

