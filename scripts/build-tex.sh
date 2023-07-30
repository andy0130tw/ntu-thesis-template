#!/bin/bash
set -eu
set -o pipefail

source scripts/setup-env.sh

pushd $PROJECT_PATH > /dev/null

LATEX_OUTPUT_PATH=dist/main_pandoc.tex

# Build LaTeX
mkdir -p dist
pandoc --defaults pandoc --output $LATEX_OUTPUT_PATH |
  if [ -n "$(command -v latex-log-sieve)" ]; then texlogsieve; else cat; fi

function clean_up {
  popd > /dev/null
  # Perform program exit housekeeping
  if [ -n $LATEX_PID ]; then
    echo ...Interrupted...
    kill -9 $LATEX_PID
    exit 1
  fi
  echo
  exit 0
}
trap clean_up SIGINT SIGTERM

# If built standalone, use this:
xelatex --jobname=dist/thesis --halt-on-error -interaction=nonstopmode $LATEX_OUTPUT_PATH &
LATEX_PID=$!
wait $LATEX_PID
popd > /dev/null
