# frozen_string_literal: true

module Tripletexer::Endpoints
  class DeliveryAddress < AbstractEndpoint
    # https://tripletex.no/v2-docs/#!/deliveryAddress/DeliveryAddress_search
    def search(params = {})
      find_entities('/v2/deliveryAddress', params)
    end

    # https://tripletex.no/v2-docs/#!/deliveryAddress/DeliveryAddress_get
    def find(id, params = {})
      find_entity("/v2/deliveryAddress/#{id}", params)
    end

    # https://tripletex.no/v2-docs/#!/deliveryAddress/DeliveryAddress_search
    def update(id, body)
      update_entity("/v2/deliveryAddress/#{id}", body)
    end
  end
end
