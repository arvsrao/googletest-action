#!/usr/bin/env bash

cd "$GITHUB_WORKSPACE" || exit 1

mkdir build
cd build
cmake ../
make
./test/convex_hull_tests
