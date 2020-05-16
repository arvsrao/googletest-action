#!/usr/bin/env bash
cd "$GITHUB_WORKSPACE" || exit 1

ln -sfn ${GTEST_DIR} ./test/gtest
mkdir build
cd build
cmake ../
make

for f in $(find test/ -type f -executable); do
  echo "running test suite " $f
  ./$f
done
