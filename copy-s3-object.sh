#!/bin/bash

# Parameters:
# $1 profile i.e. dev | prod
# $2 bucket name i.e. vdvideo
# $3 object's name first char i.e. 0 | 1 | a | f

include="$3*.mov"
bucket="s3://$2/"

echo Include files: $include

aws s3 cp \
      --exclude "*" \
      --include $include \
      --content-type "video/mp4" \
      --metadata-directive REPLACE \
      --acl public-read \
      --sse AES256 \
      --profile $1 \
      --recursive \
      $bucket \
      $bucket

echo Finished
