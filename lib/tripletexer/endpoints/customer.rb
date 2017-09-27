# frozen_string_literal: true

module Tripletexer::Endpoints
  class Customer < AbstractEndpoint

    # https://tripletex.no/v2-docs/#!/customer/search
    def search(params = {})
      find_entities('/v2/customer', params)
    end

    # https://tripletex.no/v2-docs/#!/customer/post
    def create(body)
      create_entity('/v2/customer', body)
    end

    # https://tripletex.no/v2-docs/#!/customer/get
    def find(id, params = {})
      find_entity("/v2/customer/#{id}", params)
    end

    # https://tripletex.no/v2-docs/#!/customer/put
    def update(id, body)
      update_entity("/v2/customer/#{id}", body)
    end

    def category
      Tripletexer::Endpoints::Customer::Category.new(api_client)
    end

  end
end
