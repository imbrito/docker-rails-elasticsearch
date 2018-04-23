FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /b2w
WORKDIR /b2w
COPY Gemfile /b2w/Gemfile
COPY Gemfile.lock /b2w/Gemfile.lock
RUN gem install bundler
RUN cd /b2w && bundle install
COPY . /b2w
