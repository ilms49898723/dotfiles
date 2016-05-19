#!/bin/bash
#
# Install Oracle JDK, JRE through Web Up8 Oracle Java OOS
# Run this script only when you want to install JAVA through PPA
# Run this script with sudo
#
# Maintainer: lb
#
# Last Updated: 20160519


# install python-software-properties
apt-get install python-software-properties

# add apt-repository
add-apt-repository ppa:webupd8team/java

# update
apt-get update

# install oravle-java-8-installer
apt-get install oracle-java8-installer

# apt-get install oracle-java8-set-default
