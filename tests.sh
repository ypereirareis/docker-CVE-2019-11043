#!/usr/bin/env bash
set -eu

docker build -t ypereirareis/cve-2019-11043 .
docker run --rm ypereirareis/cve-2019-11043 -h

echo ""
echo "SUCCESS !!!"
