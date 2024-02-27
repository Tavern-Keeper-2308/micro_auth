#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec puma -C config/puma.rb
