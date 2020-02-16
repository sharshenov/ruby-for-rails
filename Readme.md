# Alpine ruby images for Rails

Basically, the same [alpine ruby](https://hub.docker.com/_/ruby?tab=tags&page=1&name=-alpine) images, but with few of changes:
1. `postgresql-client`, `xz-libs`, `tzdata` packages are preinstalled
2. [`space_efficient_bundle_install`](#space_efficient_bundle_install-script) script added
3. [`space_efficient_assets_precompile`](#space_efficient_assets_precompile-script) script added

## `space_efficient_bundle_install` script

This script installs build dependencies for `bundle install` and cleanups afterwards. Default list:
- make
- gcc
- libc-dev
- libxml2-dev
- libxslt-dev
- postgresql-dev

You can pass extra dependencies. For example `space_efficient_bundle_install git sqlite-dev`

## `space_efficient_assets_precompile` script

This script installs Nodejs & Yarn for `rake assets:precompile` and cleanups afterwards (including node_modules & yarn cache dirs).

## Example Dockerfile for basic Rails application

```Dockerfile
FROM sharshenov/ruby-for-rails:2.6.5-alpine

COPY Gemfile Gemfile.lock ./
RUN space_efficient_bundle_install

ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=true

COPY . .

RUN space_efficient_assets_precompile
```

## To add new version

```sh
TARGET_VERSION=2.7.1-alpine make
```