#!/usr/bin/env bash
<<<<<<< HEAD
# Assume libcpptraj.so is already built
set -e
=======
>>>>>>> parent of b8ef017... deleting pytraj

FEEDSTOCK_ROOT=$(cd "$(dirname "$0")/../../"; pwd;)
DOCKER_IMAGE=hainm/pytraj-build-box:2019-03

docker info
cat << EOF | docker run -i \
                        -v ${FEEDSTOCK_ROOT}:/feedstock_root \
                        -a stdin -a stdout -a stderr \
                        ${DOCKER_IMAGE}\
                        bash || exit $?

set -x
<<<<<<< HEAD
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
=======
cd /feedstock_root/

export python=/opt/python/cp36-cp36m/bin/python

if [ ! -d dist ]; then
    \$python ./devtools/mkrelease
fi

if [ ! -d cpptraj ]; then
    \$python scripts/install_libcpptraj.py github -openmp
else
    # (cd cpptraj && git pull && git clean -fdx .)
    \$python scripts/install_libcpptraj.py -openmp
fi

cd dist
\$python ../scripts/build_wheel.py pytraj*gz --manylinux-docker

cd ..
>>>>>>> parent of b8ef017... deleting pytraj
EOF
