#!/bin/bash

EXEC_FILE="/code/riscv-sim/bin/riscv-console-sim"
if [ ! -f $EXEC_FILE ]; then
    CUR_DIR="$(pwd)"
    MAKE_CMD="cd /code/riscv-sim && make clean && make && cd $CUR_DIR"
    echo $MAKE_CMD
    ( cd /code/riscv-sim && make clean && make && cd $CUR_DIR )
    if [ $? -neq 0 ]; then
        exit
    fi
fi
SIM_RUN_CMD="runuser -u docker $EXEC_FILE -- $@"
echo $SIM_RUN_CMD
$SIM_RUN_CMD
