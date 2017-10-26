# frozen_string_literal: true

module Tripletexer::Endpoints
  class Product < AbstractEndpoint

    # https://tripletex.no/v2-docs/#!/product/search
    def search(params = {})
      find_entities('/v2/product', params)
    end

    # https://tripletex.no/v2-docs/#!/product/get
    def find(id, params = {})
      find_entity("/v2/product/#{id}", params)
    end

    # https://tripletex.no/v2-docs/#!/product/post
    def create(body)
      create_entity('/v2/product', body)
    end

    # https://tripletex.no/v2-docs/#!/product/put
    def update(id, body = {})
      update_entity("/v2/product/#{id}", body)
    end

    def unit
      ::Tripletexer::Endpoints::Product::Unit.new(api_client)
    end

  end
end
