#!/bin/bash
echo "RUNNING HIVE"

SAFE_MODE=`/opt/hadoop/bin/hdfs dfsadmin -safemode get`
case "$SAFE_MODE" in
    *ON*)
        sleep 10;
        /opt/hadoop/bin/hdfs dfsadmin -safemode leave
        sleep 10;
    ;;
esac
case $1 in
    hiveserver2)
        echo "RUNNING HIVE SERVER"
        sleep 10;
        echo "RUNNING HIVE SERVER"
        /opt/hive/bin/hive --service $1

    ;;
    metastore)
        echo "RUNNING HIVEMETASTORE SERVER"
        /opt/hive/bin/schematool -dbType $2 -initSchema
        /opt/hive/bin/hive --service metastore
    ;;
esac

