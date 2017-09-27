# frozen_string_literal: true

module Tripletexer::Endpoints
  class Employee < AbstractEndpoint
    # https://tripletex.no/v2-docs/#!/employee/search
    def search(params = {})
      find_entities('/v2/employee', params)
    end

    # https://tripletex.no/v2-docs/#!/employee/get
    def find(id, params = {})
      find_entity("/v2/employee/#{id}", params)
    end

    def entitlement
      Tripletexer::Endpoints::Employee::Entitlement.new(api_client)
    end

  end
end
