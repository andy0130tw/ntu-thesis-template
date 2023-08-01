#!/bin/bash
set -eu

source $(dirname "$0")/setup-env.sh

function assert_in_path() {
  echo -ne "Command \"\x1b[1m$1\x1b[0m\": "
  res=$(command -v "$1" || true)
  if [ -z $res ]; then
    echo -e "\x1b[1;31mNOT FOUND in PATH :(\x1b[0m"
    echo "  >>> Search for: $3 <<<"
    FAILED=1
  else
    echo -e "\x1b[1;32mFound ($res)\x1b[0m"
    eval "$2"
  fi
  echo
}

FAILED=0
assert_in_path xelatex         "xelatex --version | head -n 3"     "XeLaTeX (TeX Live is recommended)"
assert_in_path pandoc          "pandoc --version | head -n 5"      "Pandoc (https://github.com/jgm/pandoc)"
assert_in_path pandoc-crossref "pandoc-crossref --version"         "pandoc-crossref (https://github.com/lierdakil/pandoc-crossref)"
assert_in_path qpdf            "qpdf --version"                    "qpdf (https://github.com/qpdf/qpdf)"
assert_in_path texlogsieve     "texlogsieve --version | head -n 3" "texlogsieve, optional (https://gitlab.com/lago/texlogsieve)"

if [ $FAILED -eq 0 ]; then
  echo -e "\x1b[1mAll checks pass!\x1b[0m"
fi
