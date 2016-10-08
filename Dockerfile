FROM debian:wheezy

MAINTAINER HDizzle

#so the repository lists can be update
RUN apt-get update -y

#needed so Python will be able to copy Pip
RUN apt-get install -y libssl-dev openssl && \

#install wget, make, and gcc
apt-get install -y wget && \
apt-get install -y make && \
apt-get install -y gcc && \

#so the www.python.org certificate will be recognized
apt-get install -y ca-certificates

#get source for Python3.5
RUN wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz

#decompress and extract
RUN tar xzvf Python-3.5.2.tgz

#build Python3.5 from source
RUN cd Python-3.5.2 && \
./configure && \
make && \
make install && \

#create alias so typing python always pulls up python3.5
echo "alias python=python3" >> ~/.bashrc && \
alias python=python3


#clean up environment
RUN rm -rf Python-3.5.2 Python-3.5.2.tgz
