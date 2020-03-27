FROM ruby:2.7.0-alpine

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev && \
  rm -rf /var/cache/apk/* && \
  gem install bundler

WORKDIR /srv/native_styles

ADD Gemfile .
#ADD Gemfile.lock .

RUN bundle install

ADD . .
