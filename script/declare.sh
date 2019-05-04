#!/bin/bash

func1()
{
  echo This is a function.
}

declare -f 		# Lists the function above.

echo

declare -i var1		# var1 is an integer
var1=2367
echo "var1 declared as $var1"
var1=var1+1		# Integer declaration eliminates the nedd fo 'let'.
# Attempting to change var1 to floating point value, 2367.1."
var1=2367.1		# Results in eror message, with no change to avriable.
echo "var1 is still $var1"

echo

declare -r var2=13.36	# 'declare' permits setting a variable property
			#+ and simultaneously assigning it a value.
echo "var2 declared as $var2" # Attempt to change readonly variable.
var2=13.37		# Generates erro message, and exit from script

echo "var2 is still $var2" # This line will not execute.

exit 0 			# Scrpit will not exit

