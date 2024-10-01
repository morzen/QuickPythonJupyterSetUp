#!/bin/bash

sudo apt install jupyter
pip install jupyterlab

which jupyter
jupyter --version


jupyter server --generate-config
jupyter server password


jupyter server --show-config


jupyter lab --generate-config

jupyter lab --show-config


jupyter lab --ip 127.0.0.1
#loop back address used her ebut other may be used
#the default port is 8888


