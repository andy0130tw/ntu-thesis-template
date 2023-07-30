#!/bin/bash

PROJECT_PATH=$(realpath $(dirname "$0")/..)
PANDOC_BIN_PATH=$PROJECT_PATH/deps/bin

if [ -f PANDOC_BIN_PATH ]; then
  PATH=$PANDOC_BIN_PATH:$PATH
fi
