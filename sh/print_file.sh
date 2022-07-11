#!/bin/bash

### does not print formatted
# echo "$(cat file.txt)"

### does print formatted
# printf '%b\n' "$(cat file.txt)"
# echo "`<file.txt`"

echo "$(<file.txt)"
