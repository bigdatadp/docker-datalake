#!/bin/bash
if [[$1 -eq "namenode"]]
then
    echo "Format Namenode data"
    /opt/hadoop/bin/hdfs namenode -format 
else
    echo "Running Node $1"
    /opt/hadoop/bin/hdfs $1 -format 
fi