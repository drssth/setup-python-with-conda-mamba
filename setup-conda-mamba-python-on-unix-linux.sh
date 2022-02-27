#!/bin/bash

DIR="/home/$USER/mambaforge"
EXE="Mambaforge-Linux-x86_64.sh"
ENV="/home/$USER/mambaforge/envs/py310"

#
if [ -d "$DIR" ]; then
  echo "========> ${DIR} already exists"
  ###  setup conda and mamba ###
  echo "========> mambaforge already exist. config mamba and conda"
  echo "========> add channel bioconda"
  mamba config --add channels bioconda
  echo "========> list all envs"
  mamba info --envs
  echo "========> update all"
  mamba update --all -y
  if [ -d "$ENV" ]; then
    echo "========> env py310 exists"
  else
    echo "========> create new env"
    mamba create -n py310 python=3.10 -y
  fi
  echo "========> list all envs"
  mamba info --envs
  echo "========> activate new env"
  mamba activate py310
  echo "========> update all"
  mamba update --all -y
  echo "========> list all envs"
  mamba info --envs
  echo "========> install packages"
  mamba install numpy pandas scipy scikit-learn scikit-image matplotlib seaborn-y
  echo "========> install jupyter"
  mamba install jupyter notebook jupyterlab -y
  echo "========> install jupyterhub"
  mamba install -c conda-forge jupyterhub -y
  echo "========> verify jupyter"
  jupyter -h # you should see help information of jupyter
  echo "========> verify jupyterhub"
  jupyterhub -h # you should see help information of jupyterhub
  echo "========> deactivate env"
  mamba deactivate
  echo "========> list all envs"
  mamba info --envs
  # remove an env
  #conda remove --name py310 --all
else
  echo "========> installing mambaforge in ${DIR}..."
  if [ -f "$EXE" ]; then
    echo "========> $EXE exists"
  else
    # open web page https://github.com/conda-forge/miniforge
    # download exe from https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
    # suppose you have wget installed (you may change to curl):
    echo "========> download $EXE"
    wget "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh"
  fi
  echo "========> run installation"
  sh Mambaforge-Linux-x86_64.sh
  # follow the prompt to complete the installation
  echo "========> finish installation, close and reopen terminal, then re-run this script to setup conda/mamba"
  # note: you may need to run "mamba init" manually
fi

echo "done"
