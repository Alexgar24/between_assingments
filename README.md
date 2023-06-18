# DevOps Assignments for BETWEEN Technology job application

This repository contains all the code required for the three exercises in the assignments.

## 1 GitHub Actions

The file with the required configuration is [python_cicd.yml](https://github.com/Alexgar24/between_assingments/blob/main/.github/workflows/python_cicd.yml).

Instead of testing a random repository, I am testing the Python module built in exercise 3.

## 2 Jenkins

This is the file required for the second assignment: [Jenkinsfile](https://github.com/Alexgar24/between_assingments/blob/main/Jenkinsfile). It has no integration with the rest of the repository, and it has not been tested, since a Jenkins server is needed for that.

## 3 Python Module

This exercise requires more than one file to work:

 - [compile_one.sh](https://github.com/Alexgar24/between_assingments/blob/main/compile_one.sh): Compiles the C++ code into a shared library called one.so.
 - [build_one.sh](https://github.com/Alexgar24/between_assingments/blob/main/build_one.sh): Prepares the One Python module and the necessary files to upload it to PyPI.
 - [setup.py](https://github.com/Alexgar24/between_assingments/blob/main/setup.py): Necessary configuration to generate the One Python module.
 - [test_one.py](https://github.com/Alexgar24/between_assingments/blob/main/test_one.py): File that tests the only function in the One Python module.
