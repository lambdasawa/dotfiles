#!/bin/bash

set -xe

for path in $(find . -type f | grep -e '\.fish$'); do
	fish_indent -w $path
done
