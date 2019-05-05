#!/bin/bash
# generate-script.sh
# Based on an idea by Albert Reiner.

OUTFILE=generated.sh		# Name of the file to generate


# ------------------------------------------------------------
# `Here document containing the body of  the generated scripts.
(
cat <<'EOF'
#!/bin/bash

echo "This is a generated shell script."
#  Note that since we are inside a subshell
#+ we can't access varibale in the "outside" script"

echo "Generated file will be named: $OUTFILE"
#  Above line will not work as normally expected
#+ beacuse parameter expansion has been disabled.
#  Instead, the result is literal output.

a=7
b=3

let "c = $a * $b"
echo "c = $c"

exit 0
EOF
) > $OUTFILE
#--------------------------------------------------------------

#  Quoting the 'limit string' prevents varibale expansion
#+ within the body of the above 'here document.'
#  This permits outputing literal strings in the output file.

if [ -f "$OUTFILE" ]
then 
  chmod 755 $OUTFILE
  # Make the generated file executable.
else
  echo "Problem in creating file: \"$OUTFILE\""
fi

#  This method alse works for generating
#+ C programs, perl programs, Python programs, Makefiles,
#+ and the like.

exit 0

