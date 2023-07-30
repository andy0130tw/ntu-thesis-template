#!/bin/bash
set -eu

if [ $# -ne 2 ]; then
  echo "Usage: PASSWORD=<PASSWORD> $0 <INPUT> <OUTPUT>"
  exit 1
fi

if [ -z "$PASSWORD" ]; then
  echo "Password missing."
  echo "Supply the password from env. variable \$PASSWORD."
  exit 1
fi

INFILE=$1
OUTFILE=$2

qpdf "$INFILE" --encrypt "" "$PASSWORD" 256 --print=full --accessibility=y --extract=n --modify=none -- "$OUTFILE"
echo "$INFILE -> $OUTFILE"
