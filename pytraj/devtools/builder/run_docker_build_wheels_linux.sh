#!/usr/bin/env bash
# Assume libcpptraj.so is already built
set -e

FEEDSTOCK_ROOT=$(cd "$(dirname "$0")/../../"; pwd;)
DOCKER_IMAGE=hainm/pytraj-build-box:2019-03

docker info
cat << EOF | docker run -i \
                        -v ${FEEDSTOCK_ROOT}:/feedstock_root \
                        -a stdin -a stdout -a stderr \
                        ${DOCKER_IMAGE}\
                        bash || exit $?

set -x
set -e
cd /feedstock_root/

export PATH="/opt/python/cp38-cp38/bin:\$PATH"

if [ ! -d dist ]; then
    devtools/mkrelease
fi

ls -la dist
cd dist
python ../scripts/build_wheel.py ./pytraj*gz --manylinux-docker --py 3.5 3.6 3.7 3.8

rm -rf scripts/__pycache__
EOF
