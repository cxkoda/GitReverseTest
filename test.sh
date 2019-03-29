#!/bin/bash

cd $REVTEST_REPO/src
g++ prog.cpp > /dev/null 2>&1 || exit $?
./a.out > /dev/null 2>&1 || exit $?
