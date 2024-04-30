#!/usr/bin/env bash
number=$(gcovr --filter source  --json-summary --exclude source/main.cpp | jq '.function_percent')

result=$(echo "$number > 90" | bc)

if [ $result -eq 1 ]; then
  echo "Coverage is greater than 90%"
  exit 0
else
  echo "Coverage is less than 90%"
  gcovr --filter source  --json-summary --exclude source/main.cpp
  exit 1
fi
