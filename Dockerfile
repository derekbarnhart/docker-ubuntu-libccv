# This is a comment
FROM ubuntu:14.04
MAINTAINER Jonathan Hickford <jonathan.hickford@gmail.com>
RUN apt-get update 
RUN apt-get install -y git
RUN apt-get install -y gcc
RUN apt-get install -y libpng-dev
RUN apt-get install -y libpeg-dev
RUN apt-get install -y libfftw3-dev
RUN apt-get install -y make
RUN apt-get install -y libavcodec-dev
RUN apt-get install -y libavformat-dev
RUN apt-get install -y libswscale-dev
RUN apt-get install -y libdispatch-dev
RUN apt-get install -y libev-dev
RUN apt-get install -y libatlas-base-dev
RUN apt-get install -y libblas-dev
RUN apt-get install -y libgsl0-dev
RUN apt-get install -y wget

#Ruby dependencies
RUN apt-get install -y git-core
RUN apt-get install -y curl
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y build-essential
RUN apt-get install -y libssl-dev
RUN apt-get install -y libreadline-dev
RUN apt-get install -y libyaml-dev
RUN apt-get install -y libsqlite3-dev
RUN apt-get install -y sqlite3
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libxslt1-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y python-software-properties
RUN apt-get install -y libffi-dev
RUN apt-get install -y libgdbm-dev 
RUN apt-get install -y libncurses5-dev
RUN apt-get install -y automake
RUN apt-get install -y libtool
RUN apt-get install -y bison
RUN apt-get install -y libffi-dev

#Install ruby
RUN curl -L https://get.rvm.io | bash -s stable
RUN source ~/.rvm/scripts/rvm
RUN rvm install 2.2.2
RUN rvm use 2.2.2 --default
RUN ruby -v


#Get and make CCV
RUN git clone https://github.com/liuliu/ccv.git
COPY make_ccv.sh /
RUN /make_ccv.sh
COPY run_ccv.sh /
EXPOSE 3350
CMD /run_ccv.sh

