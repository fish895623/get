#!/usr/bin/env bash
number=$(gcovr --filter source  --json-summary --exclude source/main.cpp | jq '.function_percent')

if [ $number -gt 90 ]; then
  echo "Coverage is greater than 90%"
  exit 0
else
  echo "Coverage is less than 90%"
  exit 1
fi
