# frozen_string_literal: true

module Tripletexer::Endpoints
  class Crm::Prospect < Tripletexer::Endpoints::AbstractEndpoint
    # https://tripletex.no/v2-docs/#!/crm47prospect/search
    def search(params)
      find_entities('/v2/crm/prospect', final_params)
    end

    # https://tripletex.no/v2-docs/#!/crm47prospect/get
    def find(id, params = {})
      find_entity("/v2/crm/prospect/#{id}", params)
    end
  end
end
