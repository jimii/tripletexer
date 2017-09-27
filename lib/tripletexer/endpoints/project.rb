# frozen_string_literal: true

module Tripletexer::Endpoints
  class Project < AbstractEndpoint

    # https://tripletex.no/v2-docs/#!/project/search
    def search(params = {})
      find_entities('/v2/project', params)
    end

    # https://tripletex.no/v2-docs/#!/project/getForTimeSheet
    def get_for_time_sheet(params = {})
      find_entities('/v2/project/>forTimeSheet', params)
    end

    # https://tripletex.no/v2-docs/#!/project/get
    def find(id, params = {})
      find_entity("/v2/project/#{id}", params)
    end

    def category
      Tripletexer::Endpoints::Project::Category.new(api_client)
    end

  end
end
