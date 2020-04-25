#!/usr/bin/env bash

cd "$GITHUB_WORKSPACE" || exit 1

ln -s /usr/src/gtest/googletest ./test/gtest 
mkdir build
cd build
cmake ../
make
./test/convex_hull_tests
