# Tripletexer - ruby client for tripletex.no API v2

[![Build Status](https://travis-ci.org/graudeejs/tripletexer.svg?branch=master)](https://travis-ci.org/graudeejs/tripletexer)
[![CircleCI](https://circleci.com/gh/graudeejs/tripletexer.svg?style=svg)](https://circleci.com/gh/graudeejs/tripletexer)
[![Code Climate](https://codeclimate.com/github/graudeejs/tripletexer.svg)](https://codeclimate.com/github/graudeejs/tripletexer)
[![Coverage Status](https://coveralls.io/repos/github/graudeejs/tripletexer/badge.svg?branch=master)](https://coveralls.io/github/graudeejs/tripletexer?branch=master)
[![Gem Version](https://badge.fury.io/rb/tripletexer.svg)](https://badge.fury.io/rb/tripletexer)

## Getting started
Add tripletexer to your Gemfile
```ruby
gem 'tripletexer', '~> 0.2.0'
```
run bundle install

## Using tripletexer

Tripletex.no API documentation can be found here: https://tripletex.no/v2-docs/

This gem tries to fallow patterns of tripletex.no documentation, however not completely.

```ruby
client = Tripletexer.new

# start new session
client.token.session.create('your_consumer_token', 'your_employee_token')

client.invoice.search(Date.new(2017), Time.now.to_date).each do |invoice|
  # do something with invoice
end

# revoke token
client.token.session.destroy
```

When tipletex.no API returns a list tripletexer gem returns an instance of
enumerator, this way you never have to deal with pagination.

## TODO

Write some tests
