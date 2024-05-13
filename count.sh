#!/bin/bash

#file=$(ls | cut -c1 | grep -v d | wc -l)
#dirs=$(ls | cut -c1 | grep d | wc -l)

#echo "현재 위치: $(pwd)"
#echo "파일 $file개, 폴더 $dirs개입니다."



dir="$1"

file=$(ls -l "$dir" | cut -c1 | grep -v d | wc -l)
dirs=$(ls -l "$dir" | cut -c1 | grep d | wc -l)
echo "현재 위치: $"$dir""
echo "파일 $file개, 폴더 $dirs개입니다."