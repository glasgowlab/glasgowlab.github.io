myenv=myenv
conda install ambertools=17 -c http://ambermd.org/downloads/ambertools/conda/ -y
python_ver=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
echo "python_ver" $python_ver

<<<<<<< HEAD
rm -rf $HOME/miniconda3/envs/$myenv/lib/python$python_ver/site-packages/pytraj*
=======
rm -rf $HOME/miniconda3/envs/$myenv/lib/python$python_ver/site-packages/pytraj
rm -rf $HOME/miniconda3/envs/$myenv/lib/python$python_ver/site-packages/pytraj-2.0.0-py3.6.egg-info
>>>>>>> parent of b8ef017... deleting pytraj
rm $HOME/miniconda3/envs/$myenv/lib/libcpptraj*
