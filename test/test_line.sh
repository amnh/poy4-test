#!/bin/bash
# Run a test. If there is a third argument, it is passed to the poy_test program
# to verify the cost of the tree (which should match the value of the third
# argument. Otherwise, only check for normal termination.
temp=tmp.log
temp_script=tmp_script.poy
if [ -n "$3" ]
then
    $2 > ${temp_script}
    if cat ${temp_script} | ./poy_test -c $3 &> ${temp}
    then
        echo "PASSED: $1"
    else
        mv ${temp} "${1}.err"
        echo "FAILED: $1"
    fi
else
    echo "Executing ./poy_test"
    $2 > ${temp_script}
    if cat ${temp_script} | ./poy_test &> ${temp}
    then
        echo "PASSED: $1"
    else
        mv ${temp} "${1}.err"
        echo "FAILED: $1"
    fi
fi
