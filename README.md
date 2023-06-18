# DevOps Assignments for Between Technologies job application

This repository contains all the code required for the 3 exercises in the assigments.

## 1 GitHub Actions

The file with the required configuration
is [python_cicd.yml](https://github.com/Alexgar24/between_assingments/blob/main/.github/workflows/python_cicd.yml).

Instead of testing a random repository, I am testing the python module built in exercise 3


## 2 Jenkins

This is the file that is required by the second assignment:
[Jenkinsfile](https://github.com/Alexgar24/between_assingments/blob/main/Jenkinsfile).
It has no integration with the rest of the repository at all, and it has not been tested, since a Jenkins server is needed for that.


## 3 Python Module

This exercise require more than file to work:
 - [compile_one.sh](https://github.com/Alexgar24/between_assingments/blob/main/compile_one.sh): Compile the C++ code into a shared library one.so
 - [build_one.sh](https://github.com/Alexgar24/between_assingments/blob/main/build_one.sh): Prepare the One python module,
and prepare the necesary files to upaload it to PyPI.
 - [sutup.py](https://github.com/Alexgar24/between_assingments/blob/main/sutup.py): Neccesary configuration to generate the One python module.
 - [test_one.py](https://github.com/Alexgar24/between_assingments/blob/main/test_one.py): File that tests the only function in the One python module.
