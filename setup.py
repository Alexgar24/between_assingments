# setup.py

from setuptools import setup, Extension

# the c++ extension module
one_module = Extension('_one', sources=['one_wrap.cxx', "one.cpp"])

setup(
    name='one',
    version='0.1',
    author="A kind applicant to Between Technology",
    description="""A Python package wrapping a C++ library""",
    ext_modules=[one_module],
    py_modules=["one"]
)