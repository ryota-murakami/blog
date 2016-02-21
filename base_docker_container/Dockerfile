FROM ubuntu:14.04
# Install basic packages
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
RUN echo deb http://repo.percona.com/apt trusty main >> /etc/apt/sources.list
RUN echo deb-src http://repo.percona.com/apt trusty main >> /etc/apt/sources.list


RUN apt-get update
RUN apt-get install -y wget curl git
RUN apt-get install -y libc6-dev libc6 libc-dev gcc g++ cpp g++ build-essential
RUN apt-get install -y zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev

# supervisor, nginx...
RUN apt-get install -y nginx supervisor
RUN apt-get install -y libssl-dev libperconaserverclient18.1-dev
RUN apt-get install -y nodejs

# Install ruby-build
RUN git clone https://github.com/sstephenson/ruby-build.git .ruby-build
RUN .ruby-build/install.sh
RUN rm -fr .ruby-build

# Install ruby-2.2.2
RUN ruby-build 2.2.2 /usr/local

# Install bundler
RUN gem update --system
RUN gem install bundler --no-rdoc --no-ri
RUN gem install mysql2 --version "=0.3.19" --no-rdoc --no-ri

RUN gem install rails --version "~>4.2.0" --no-rdoc --no-ri
RUN gem install unicorn  --version "~>4.9.0" --no-rdoc --no-ri



ENTRYPOINT ["bash", "-l", "-c"]
