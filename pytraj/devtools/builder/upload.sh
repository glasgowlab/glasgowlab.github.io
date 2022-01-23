<<<<<<< HEAD
#!/usr/bin/env bash
set -e
=======
>>>>>>> parent of b8ef017... deleting pytraj

function main(){
    upload_pip
    upload_conda
}


function upload_conda(){
    anaconda upload dist/conda/*-64/pytraj-*-py*.tar.bz2 --user ambermd
}


function upload_pip(){
    twine upload dist/wheelhouse/pytraj*.whl
}

main
