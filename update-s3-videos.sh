#!/bin/bash

# Parameters:
# $1 profile i.e. dev | prod
# $2 bucket name i.e. vdvideo

characters="0 1 2 3 4 5 6 7 8 9 a b c d e f"

for char in $characters
do
  echo Running command for files: $char*.mov
  nohup ./copy-s3-object.sh $1 $2 $char > "./logs/output-$char" 2>&1 &
done

wait
