# set up python with conda/mamba

# open web page https://github.com/conda-forge/miniforge
# download exe from https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Windows-x86_64.exe
# if you have wget, you may run:
# wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Windows-x86_64.exe
# double click the exe to install mambaforge
# open mambaforge command prompt


echo "========> mambaforge already exist. config mamba and conda"
echo "========> add channel bioconda"
mamba config --add channels bioconda
echo "========> list all envs"
mamba info --envs
echo "========> update all"
mamba update --all -y
echo "========> create new env"
mamba create -n py310 python=3.10 -y
echo "========> list all envs"
mamba info --envs
echo "========> activate new env"
mamba activate py310
echo "========> list all envs"
mamba info --envs
echo "========> update all"
mamba update --all -y
echo "========> install packages"
mamba install numpy pandas scipy scikit-learn scikit-image matplotlib seaborn -y
echo "========> install jupyter"
mamba install jupyter notebook jupyterlab -y
# jupyterhub does not work on windows
echo "========> verify jupyter"
jupyter -h # you should see help information of jupyter
echo "========> deactivate env"
mamba deactivate
echo "========> list all envs"
mamba info --envs
# remove an env
#conda remove --name py310 --all