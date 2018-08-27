FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /portafolio_container
# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1
WORKDIR /portafolio_container

ADD Gemfile /portafolio_container/Gemfile
ADD Gemfile.lock /portafolio_container/Gemfile.lock
RUN bundle install

ADD . /portafolio_container