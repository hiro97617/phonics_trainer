
FROM ruby:3.0.1


# Use the official Ruby image from Docker Hub
# https://hub.docker.com/_/ruby

# [START cloudrun_rails_base_image]
# Pinning the OS to buster because the nodejs install script is buster-specific.
# Be sure to update the nodejs install command if the base image OS is updated.
# [END cloudrun_rails_base_image]
# Install vim editor in order to edit credential files.
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev vim

RUN (curl -sS https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | apt-key add -) && \
    echo "deb https://deb.nodesource.com/node_14.x buster main"      > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs lsb-release

RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list
RUN set -x && apt-get update -y -qq && apt-get install -yq yarn


WORKDIR /app
COPY ./src/Gemfile /app/Gemfile
COPY ./src/Gemfile.lock /app/Gemfile.lock

#bundle lock ~ bundle config 'test'は本番環境のデプロイ時に実行

RUN gem install bundler && \
    #bundle lock --add-platform x86_64-linux && \
    #bundle config set --local deployment 'true' && \
    #bundle config set --local without 'development test' && \
    bundle config --local set path 'vendor/bundle' && \
    bundle config set --global force_ruby_platform true && \
    bundle install

# Copy application code to the container image
#以下のコマンドは本番環境実行時に行う。
#COPY ./src /app

#ENV RAILS_ENV=production
#ENV RAILS_SERVE_STATIC_FILES=true
# Redirect Rails log to STDOUT for Cloud Run to capture
#ENV RAILS_LOG_TO_STDOUT=true
#[START cloudrun_rails_dockerfile_key]
#ARG MASTER_KEY
#ENV RAILS_MASTER_KEY=${MASTER_KEY}
#[END cloudrun_rails_dockerfile_key]

# pre-compile Rails assets with master key
#RUN bundle exec rails assets:precompile

#EXPOSE 8080
#CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "8080"]
