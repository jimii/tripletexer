# frozen_string_literal: true

require 'json'
require 'uri'

module Tripletexer::Endpoints
  class AbstractEndpoint

    def initialize(api_client)
      @api_client = api_client
    end

    private

    attr_reader :api_client

    def find_entities(path, params, &block)
      Enumerator.new do |enum_yielder|
        request_params = params.dup
        begin
          result = get(path, request_params, &block)

          result['values'].each do |value|
            enum_yielder.yield(value)
          end

          request_params['from'] = result['from'] + result['count']
        end until result['fullResultSize'] <= request_params['from']
      end
    end

    def find_entity(path, params = {})
      get(path, params)['value']
    end

    def create_entity(path, body, params = {})
      post(path, params) do |req|
        req.body = ::Tripletexer::FormatHelpers.normalize_body(body)
      end['value']
    end

    def update_entity(path, body, params = {})
      put(path, params) do |req|
        req.body = ::Tripletexer::FormatHelpers.normalize_body(body)
      end['value']
    end

    def create_entities(path, body, params = {})
      post(path, params) do |req|
        req.body = ::Tripletexer::FormatHelpers.normalize_body(body)
      end['values']
    end

    def update_entities(path, body, params = {})
      put(path, params) do |req|
        req.body = ::Tripletexer::FormatHelpers.normalize_body(body)
      end['values']
    end

    def get(path, *args, &block)
      call(:get, path, *args, &block)
    end

    def post(path, *args, &block)
      call(:post, path, *args, &block)
    end

    def put(path, *args, &block)
      call(:put, path, *args, &block)
    end

    def delete(path, *args, &block)
      call(:delete, path, *args, &block)
    end

    def call(method, path, *args, &block)
      normalized_path = URI.escape(path)
      response = api_client.connection.public_send(method, normalized_path, *args, &block)
      handle_response(response)
    end

    def handle_response(response)
      body = response.body
      case response.status
      when 200, 201, 204
        body
      when 400, 422
        raise ::Tripletexer::Errors::BadRequest, body
      when 401
        raise ::Tripletexer::Errors::Unauthorized, body
      when 403
        raise ::Tripletexer::Errors::Forbidden, body
      when 404
        raise ::Tripletexer::Errors::NotFound, body
      when 409
        raise ::Tripletexer::Errors::Conflict, body
      when 500
        raise ::Tripletexer::Errors::InternalError, body
      else
        raise NotImplementedError, "don't know how to handle #{response.status} http status code"
      end
    end

  end
end
