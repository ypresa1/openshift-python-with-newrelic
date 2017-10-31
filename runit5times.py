#!/bin/python

import time

from subprocess import call

#Run the script 5 times just to get a good reading in the NewRelic UI 
#A timer put in of 6 seconds to ensure that it completes the test cycle each time
x=0
while x < 5:
	call(["newrelic-admin","validate-config","newrelic.ini"])
	x = x + 1
	time.sleep(6)

