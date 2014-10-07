FROM ubuntu:14.04
MAINTAINER Gabe Kopley <gabe@coshx.com>
# Adapted from
# https://github.com/parroty/docker-elixir/blob/master/Dockerfile

ENV CORS_TEST_SSL_KEY /etc/corstest/certs/corstest-api_coshx_com.key
ENV CORS_TEST_SSL_CERT /etc/corstest/certs/corstest-api_coshx_com.crt

# Set the locale (otherwise Elixir emits warnings)
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Update package list
RUN apt-get update

# Install nodejs
RUN apt-get install -y nodejs npm

# Install base package
RUN apt-get install -y wget git build-essential

# Install Erlang
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update
RUN apt-get install -y erlang

# Install Elixir
WORKDIR /tmp/elixir-build
RUN git clone https://github.com/elixir-lang/elixir.git
WORKDIR elixir
RUN git checkout v1.0.0 && make && make install

# Install Corstest Server
WORKDIR /opt
RUN git clone https://github.com/gkop/corstest-server
WORKDIR corstest-server
RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix do deps.get, compile

RUN MIX_ENV=prod mix compile.protocols

RUN npm install

EXPOSE 4000
