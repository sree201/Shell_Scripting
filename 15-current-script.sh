#!/bin/bash

COURSE="Devops from the current script"

echo "Before calling other script, course: $COURSE"
echo "ProcessID of current shell script: $$"

#./16-other-script.sh

source ./16-other-script.sh

echo "After calling othjer script, course: $COURSE"
