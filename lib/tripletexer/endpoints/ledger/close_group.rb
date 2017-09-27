# frozen_string_literal: true

module Tripletexer::Endpoints
  class Ledger::CloseGroup < AbstractEndpoint
    # https://tripletex.no/v2-docs/#!/ledger47closeGroup/search
    def search(date_from, date_to, params = {})
      final_params = params.merge(
        'dateFrom' => ::Tripletexer::FormatHelpers.format_date(date_from),
        'dateTo' => ::Tripletexer::FormatHelpers.format_date(date_to)
      )
      find_entities('/v2/ledger/closeGroup', final_params)
    end

    # https://tripletex.no/v2-docs/#!/ledger47closeGroup/get
    def find(id, params = {})
      find_entity("/v2/ledger/closeGroup/#{id}", params)
    end
  end
end
