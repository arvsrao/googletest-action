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

RUN apt-get -y update
RUN apt-get -y install qtbase5-dev

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
