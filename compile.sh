#!/bin/bash

set -e

if [ -z "$1" ]; then
    printf "(i) Using V.g4 as the default source.\n"
    SRC="V.g4"
else
    SRC=$1
fi

antlr4 $SRC
javac V*.java

for source in `ls tests`; do
    printf "(+) Running parser for %s...\n", $source
    grun V program tests/$source
done

./cleanup.sh