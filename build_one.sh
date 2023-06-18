#!/bin/bash

# Generate SWIG wrapper code
swig -c++ -python one.i

# Build Python package
python setup.py build_ext --inplace

# Prepare the file to be uploaded to PyPI
python setup.py sdist


