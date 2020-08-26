# Container for building and testing cmake projects v3.16
FROM ubuntu:18.04
MAINTAINER Arvind Rao

LABEL "com.github.actions.name"="GoogleTest C++ Checker"
LABEL "com.github.actions.description"="Run googletest tests on c++ programs."
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/arvsrao/googletest-action.git"
LABEL "homepage"="https://github.com/arvsrao/googletest-action"
LABEL "maintainer"="arvsrao <arvsrao@gmail.com>"

# get the latest cmake release
RUN apt-get -y update
RUN apt-get -y install software-properties-common git wget clang-10
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add -
RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'

RUN apt-get -y install build-essential cmake qtbase5-dev

RUN git clone https://github.com/google/googletest.git
RUN mkdir -p /googletest/build && \
    cd /googletest/build && \
    cmake -DCMAKE_C_COMPILER=clang-10 -DCMAKE_CXX_COMPILER=clang++-10 .. && \
    make && \
    make install && \
    cd /

RUN export GTEST_DIR="/googletest/googletest/" GTEST_LIB_DIR="/googletest/build/lib/"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
