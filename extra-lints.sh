#!/usr/bin/env bash

# Exit on error, unset variables and pipeline errors
set -euo pipefail

RET=0

# Grep returns success when found and failure when not found.
# The `[F]` is the usual trick to avoid matching this line itself
# without excluding this whole file so it's still checked.
if grep --recursive --color=auto --exclude-dir=.git --exclude-dir=public --exclude-dir=screenshots [F]IXME . ; then
    echo "The lines above this message must be fixed (or marked as todo/later in uppercase, not fixme).

Fixmes are to be fixed before committing or at least before merging to master so they can be used during development for things that must not be forgotten and grep's output is not littered with other people's fixmes."
    RET=1
fi

exit $RET

