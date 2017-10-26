# frozen_string_literal: true

module Tripletexer::Endpoints
  class Product::Unit < AbstractEndpoint

    # https://tripletex.no/v2-docs/#!/product47unit/search
    def search(params = {})
      find_entities('/v2/product/unit', params)
    end

    # https://tripletex.no/v2-docs/#!/product47unit/get
    def find(id, params = {})
      find_entity("/v2/product/unit/#{id}", params)
    end

  end
end
