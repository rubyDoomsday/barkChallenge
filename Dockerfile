FROM ruby:2.6.8

WORKDIR /app

ENV TZ="UTC"

RUN apt-get update -qq && apt-get install -y sqlite3 && \
    apt-get install -y software-properties-common && \
    apt-get install -y tzdata && \
    apt-get clean

COPY . /app

run gem install bundler:2.4.4

RUN script/setup
