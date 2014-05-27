#!/usr/bin/env bash

set -e

oracle_jdk=$1
oracle_jdk_file=$(basename $oracle_jdk)
buildpack_jdk_file="buildback-$oracle_jdk_file"
temp_dir=$(mktemp -d /tmp/buildpack-jdk.XXXXXXXXXX)

tar --strip-components 1 -xzf $oracle_jdk -C $temp_dir

# remove unneccessary components
rm -rf $temp_dir/man $temp_dir/javafx-src.zip $temp_dir/src.zip $temp_dir/lib/missioncontrol $temp_dir/lib/visualvm

tar -czf $buildpack_jdk_file -C $temp_dir .

rm -rf $temp_dir