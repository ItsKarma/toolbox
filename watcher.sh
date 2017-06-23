#!/bin/bash

while sleep 10
do
  curl -IsL $1
  echo ""
  echo "---------------------------"
  echo ""
done
