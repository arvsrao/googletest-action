#!/usr/bin/env bash

mkdir -p /googletest/build
cd /googletest/build
cmake ..
make
make install
export GTEST_DIR="/googletest/googletest/" GTEST_LIB_DIR="/googletest/build/lib/"

cd "$GITHUB_WORKSPACE" || exit 1

ln -s /google/googletest ./test/gtest
mkdir build
cd build
cmake ../
make
./test/convex_hull_tests
