#!/bin/bash

# Compile the C++ code into a shared library
g++ -fPIC -shared one.cpp -o one.so
rm one.so  # I don't want it to mess with the rest of the process

# Generate SWIG wrapper code
swig -c++ -python one.i

# Build Python package
python setup.py build_ext --inplace

# Prepare the file to be uploaded to PyPI
python setup.py sdist


