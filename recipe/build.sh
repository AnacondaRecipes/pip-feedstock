#!/bin/bash

if [[ ${BOOTSTRAP_FROM_WHL} == yes ]]; then
    # use the pip wheel to install itself
    export PYTHONPATH='./pip-${PKG_VERSION}-py3-none-any.whl'
    $PYTHON -m pip install --no-cache-dir --no-index --no-index --find-links . pip
else
    # use the pip source to install itself
    export PYTHONPATH="./src"
    $PYTHON -m pip install . --no-deps --no-build-isolation -vv
fi


cd $PREFIX/bin
rm -f pip2* pip3*
rm -f $SP_DIR/__pycache__/pkg_res*
# Remove all bundled .exe files courtesy of distlib.
rm -f $SP_DIR/pip/_vendor/distlib/*.exe
