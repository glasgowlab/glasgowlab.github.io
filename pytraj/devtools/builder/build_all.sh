<<<<<<< HEAD
#!/usr/bin/env bash
set -e

function main(){
    # Must be in pytraj root folder

    devtools/mkrelease
    clone_or_update_cpptraj

    # osx
    build_libcpptraj_osx
    pip_osx
    conda_osx

    # linux
    build_libcpptraj_linux
    pip_linux
    conda_linux
}


function create_venv(){
    if [ ! -d /tmp/pytraj_venv ]; then
        # We need to place the venv outside the checkout so it does not get wiped out by 'git clean'
        python3 -m venv /tmp/pytraj_venv
        /tmp/pytraj_venv/bin/python -m pip install -U pip setuptools wheel
        /tmp/pytraj_venv/bin/python -m pip install auditwheel numpy Cython
    fi
}

=======
#!/bin/sh

# Must be in pytraj root folder

# add cpptraj folder
python -c "import auditwheel" || exit 1

function main(){
    # this function will be run in the end of this script
    devtools/mkrelease
    clone_or_update_cpptraj
    pip_linux
    pip_osx
    conda_linux
    conda_osx
}


>>>>>>> parent of b8ef017... deleting pytraj
function clone_or_update_cpptraj(){
    if [ ! -d cpptraj ]; then
        git clone https://github.com/amber-md/cpptraj
    else
<<<<<<< HEAD
        # (cd cpptraj && git pull && git clean -fdx .)
        echo "bla bla"
=======
        (cd cpptraj && git pull && git clean -fdx .)
>>>>>>> parent of b8ef017... deleting pytraj
    fi
}


function pip_linux(){
<<<<<<< HEAD
    devtools/builder/run_docker_build_wheels_linux.sh
}


function build_libcpptraj_osx(){
    # (cd cpptraj && git clean -fdx .)
    export CPPTRAJHOME=`pwd`/cpptraj
    python scripts/install_libcpptraj.py
}


function build_libcpptraj_linux(){
    bash devtools/builder/run_docker_build_libcpptraj_linux.sh
}


function pip_osx(){
=======
    sh devtools/builder/run_docker_build_wheels_linux.sh
}


function pip_osx(){
    (cd cpptraj && git clean -fdx .)
    export CPPTRAJHOME=`pwd`/cpptraj
    python scripts/install_libcpptraj.py
>>>>>>> parent of b8ef017... deleting pytraj
    (cd dist && python ../scripts/build_wheel.py pytraj*.tar.gz)
}


function conda_linux(){
    sh devtools/builder/run_docker_build_conda_linux.sh
}


function conda_osx(){
<<<<<<< HEAD
    # for pyver in 3.5 3.6 3.7 3.8; do
    for pyver in 3.8; do
        conda build devtools/conda-recipe/pytraj --py $pyver
        tarfile=`conda build devtools/conda-recipe/pytraj --py $pyver --output`

=======
    for pyver in 2.7 3.7 3.5 3.6; do
        conda build devtools/conda-recipe/pytraj --py $pyver
        tarfile=`conda build devtools/conda-recipe/pytraj --py $pyver --output`
    
>>>>>>> parent of b8ef017... deleting pytraj
        build_dir=dist/conda/osx-64
        if [ ! -d $build_dir ]; then
            mkdir -p $build_dir
        fi
        cp $tarfile $build_dir
    done
}

main "$@"
