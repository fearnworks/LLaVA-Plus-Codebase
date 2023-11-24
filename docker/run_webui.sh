#!/bin/bash

# Ensure the script fails if any command fails, this will prevent silent issues with conda activation
set -e

source /miniconda/etc/profile.d/conda.sh

conda activate bakllava_int

cd /code
pip install loguru opencv-python-headless supervision==0.10.0 pycocotools pillow


python3 -m webui.server --controller http://controller:10000 --model-list-mode reload --port 11000