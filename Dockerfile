FROM ruby:3.1.4

ARG RUBYGEMS_VERSION=3.3.20
WORKDIR /app
COPY ./src /app
RUN gem update --system ${RUBYGEMS_VERSION} && \
    bundle install
COPY . /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]