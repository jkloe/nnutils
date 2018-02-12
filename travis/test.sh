#!/bin/bash
set -e;

# Test module in the build directory.
cd build;
make test;

# Install Python module & test the installation.
export PYTHONPATH="$HOME/.local/lib/python${TRAVIS_PYTHON_VERSION}/site-packages:$PYTHONPATH";
make install;
python -m unittest nnutils_pytorch.mask_image_from_size_test;
python -m unittest nnutils_pytorch.adaptive_avgpool_2d_test;
python -m unittest nnutils_pytorch.adaptive_maxpool_2d_test;
