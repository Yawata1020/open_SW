#!/bin/bash

name="$1"

result=$(grep "^$name " book.txt )

echo "$result"

