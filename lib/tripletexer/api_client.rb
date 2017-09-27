# frozen_string_literal: true

require 'json'
require 'faraday'
require 'faraday_middleware'

class Tripletexer::APIClient
  ENDPOINT = 'https://tripletex.no/'

  attr_reader :session_token, :debug

  def initialize(object_class: Hash, proxy: nil, debug: false)
    @object_class = object_class
    @proxy = proxy
    @debug = debug
  end

  def connection
    return @connection if session_token && @connection
    @connection = init_connection
  end

  def reset_connection
    @session_token = @connection = nil
  end

  def session_token=(new_session_token)
    reset_connection
    @session_token = new_session_token
  end

  private

  attr_reader :object_class, :proxy

  def init_connection
    Faraday.new(url: ENDPOINT) do |faraday|
      faraday.response :logger if debug
      faraday.response :json, parser_options: { object_class: object_class }, content_type: %r[/json$]
      faraday.headers = {
        'Content-Type': 'application/json'
      }
      faraday.adapter :net_http
      faraday.basic_auth(0, session_token) if session_token
      faraday.proxy = proxy if proxy # https://github.com/lostisland/faraday/issues/733
    end
  end
end
