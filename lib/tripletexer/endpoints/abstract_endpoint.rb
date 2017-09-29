# frozen_string_literal: true

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
          result = api_client.get(path, request_params, &block)

          result['values'].each do |value|
            enum_yielder.yield(value)
          end

          request_params['from'] = result['from'] + result['count']
        end until result['fullResultSize'] <= request_params['from']
      end
    end

    def find_entity(path, params = {})
      api_client.get(path, params)['value']
    end

    def create_entity(path, body, params = {})
      send_data(:post, path, body, params)['value']
    end

    def update_entity(path, body, params = {})
      send_data(:put, path, body, params)['value']
    end

    def create_entities(path, body, params = {})
      send_data(:post, path, body, params)['values']
    end

    def update_entities(path, body, params = {})
      send_data(:put, path, body, params)['values']
    end

    def send_data(method, path, body, params)
      api_client.public_send(method, path, params) do |req|
        req.body = ::Tripletexer::FormatHelpers.normalize_body(body)
      end
    end

  end
end
