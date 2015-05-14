#!/bin/sh

. /opt/vst/session_set.sh

count=`ps auxw | grep '_mprosrv -ServerType 4GL' | wc -l`
if [ $count -eq 0 ]
then
  echo 'DB stop'
  exit 2
else
  [full path to _progress]/_progres -db [full path to db] -b -p /opt/vst/db_vst.p -T [path to temp dir] -param $1
  exit 0
fi