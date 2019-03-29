#!/bin/bash

REVTEST_ROOT=$(pwd)

export REVTEST_REPO=~/temp/git_test
REVTEST_TEST=$REVTEST_ROOT/test.sh
REVTEST_MAX_TESTS=30


cd $REVTEST_REPO
#git checkout master
iTest=0

while true; do
	((iTest++))
	COMMIT=$(git rev-parse --verify HEAD)

	echo "Currently testing commit $COMMIT"
	$REVTEST_TEST

	if [ $? -eq 0 ]; then
		echo "  -> Working version found $COMMIT."
		break
	fi
	
	if [ $iTest -gt $REVTEST_MAX_TESTS ]; then
		echo "  Max iterations reached $iTest".
		break
	fi

	git checkout HEAD~1 > /dev/null 2>&1

	if [ $? -ne 0 ]; then
		echo "  End of repo reached."
		break
	fi

done



