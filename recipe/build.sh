#!/bin/bash

# use the pip source to install itself
PYTHONPATH="./src" $PYTHON -m pip install . -vv

cd $PREFIX/bin
rm -f pip2* pip3*
rm -f $SP_DIR/__pycache__/pkg_res*
# Remove all bundled .exe files courtesy of distlib.
rm -f $SP_DIR/pip/_vendor/distlib/*.exe
