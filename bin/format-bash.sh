#!/bin/bash

set -xe

for path in $(find . -type f | grep -e '\.sh$'); do
	shfmt -w $path
done
