#!/bin/sh
grep log_for_task_4.log -e $1 | grep -e 'id=22' | awk '{print $8}' | grep -o '^[0-9]*.[0-9]*' | sort > temp2.log