#!/bin/bash
set -eu

source $(dirname "$0")/setup-env.sh

function assert_in_path() {
  echo -n "Command \"$1\": "
  res=$(command -v "$1" || true)
  if [ -z $res ]; then
    echo "NOT FOUND in PATH :("
    echo "  >>> Search for: $2 <<<"
    NOTOK=1
  else
    echo "Found ($res)"
  fi
}

NOTOK=0
assert_in_path xelatex "XeLaTeX"
assert_in_path pandoc "Pandoc (https://github.com/jgm/pandoc)"
assert_in_path pandoc-crossref "pandoc-crossref (https://github.com/lierdakil/pandoc-crossref)"
assert_in_path qxpdf "qpdf (https://github.com/qpdf/qpdf)"

if [ $NOTOK -eq 0 ]; then
  echo "All checks pass!"
fi
