#!/usr/bin/env bash
cd "$GITHUB_WORKSPACE" || exit 1

ln -sfn ${GTEST_DIR} ./test/gtest
mkdir build
cd build
cmake ../
make
./test/convex_hull_tests
