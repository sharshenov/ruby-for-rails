FROM ruby:2.6.8-alpine
LABEL maintainer="Rustam Sharshenov <rustam@sharshenov.com>"

RUN apk add --update \
    # pg runtime dependency
    postgresql-client \
    # nokogiri runtime dependency
    xz-libs \
    # tzinfo-data
    tzdata \
    && rm -rf /var/cache/apk/*

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# https://devcenter.heroku.com/articles/tuning-glibc-memory-behavior
ENV MALLOC_ARENA_MAX=2

COPY templates/rails/space_efficient_* /usr/local/bin/
