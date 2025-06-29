#!/bin/sh

# Groff command to run
cmd() { groff -Tpdf -mcv $@ > cv.pdf; }

# Only attempt to use 'info.groff' file if it is present - it may not be as it
# is "gitignored". This should avoid errors. Provide a non-file argument to
# generate a redacted version.
INFO_FILE=${1:-info.groff}
if [ -f "$INFO_FILE" ]
    then cmd "$INFO_FILE" cv.groff
    else cmd cv.groff
fi
