# googletest-action
GitHub Action for googletest

Runs GoogleTest C++ tests

The action returns the number of incorrectly formatted files.

* SUCCESS: zero exit-code if project `.cpp` and `.h` files are formatted correctly
* FAILURE: nonzero exit-code if project C files are not formatted correctly

Define desired formatting rules in a .clang-format file at the repository root. Otherwise, the LLVM style guide is used as a default. Mine is based on google's style.
# Usage

To use this action, create a `.github/workflows/googletest-checker.yml` in the target repository containing:

```
name: clang-format
on:
  push:
    paths-ignore:
    - 'resources/**'
    - 'README.md'

jobs:
  formatting-check:
    name: Test Project
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Test project with googletest.
      uses: arvsrao/googletest-action@master
```
