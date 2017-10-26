# frozen_string_literal: true

module Tripletexer::Endpoints
  class Crm < AbstractEndpoint
    def prospect
      ::Tripletexer::Endpoints::Crm::Prospect.new(api_client)
    end
  end
end
