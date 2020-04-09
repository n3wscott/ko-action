#!/bin/sh -l

# Diagnostic output:
echo "Using options:"

echo "-f $INPUT_FILENAME"
echo '============================='
echo

# TODO: setup the docker config file.

# Runs ko:
output=$(ko resolve -f $INPUT_FILENAME)
status="$?"

# Sets the output variable for Github Action API:
# See: https://help.github.com/en/articles/development-tools-for-github-action
echo "::set-output name=output::$output"
echo '================================='
echo

# Fail the build in case status code is not 0:
if [ "$status" -ge 100 ]; then
  echo 'Failing with output:'
  echo "$output"
  echo "Process failed with the status code: $status"
  exit "$status"
fi