#!/bin/bash

git fetch https://github.com/SpesFides/Logserver.git

echo SpesFides
echo Timetogotoschool45

git merge origin/master

#activeer scrips
bash Saltstack_master.sh
bash Saltstack_minion_master.sh
bash Monitor_Munin.sh
bash Docker_master.sh
bash Syslog.sh
