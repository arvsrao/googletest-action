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

RUN apt purge --auto-remove cmake
RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
RUN apt-get -y install git build-essential cmake qtbase5-dev
RUN apt-get -y update

RUN git clone https://github.com/google/googletest.git
RUN mkdir -p /googletest/build && \
    cd /googletest/build && \
    cmake .. && \
    make && \
    make install && \
    cd /

RUN export GTEST_DIR="/googletest/googletest/" GTEST_LIB_DIR="/googletest/build/lib/"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
