#!/bin/sh

# use default system file creation mask
umask 002

# OpenEdge directory and option
DLC=/opt/dlc
PROTERMCAP=$DLC/protermcap
PROCOLL=$DLC/procoll.dat
PROMSGS=$DLC/promsgs
PROWD1=$DLC/proword.1
PROCFG=$DLC/progress.cfg
export DLC PROTERMCAP PROCOLL PROMSGS PROWD1 PROCFG

# System path
PATH=$DLC/bin:$PATH
export PATH 

