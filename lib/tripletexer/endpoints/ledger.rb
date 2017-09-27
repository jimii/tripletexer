# frozen_string_literal: true

module Tripletexer::Endpoints
  class Ledger < AbstractEndpoint
    DEFAULT_FIELDS = '*,account(id,number,name,description),postings(*)'

    # https://tripletex.no/v2-docs/#!/ledger/search
    def search(date_from, date_to, params = {})
      final_params = params.merge(
        'dateFrom' => ::Tripletexer::FormatHelpers.format_date(date_from),
        'dateTo' => ::Tripletexer::FormatHelpers.format_date(date_to)
      )
      final_params['fields'] = DEFAULT_FIELDS unless final_params.key?('fields')
      find_entities('/v2/ledger', final_params)
    end

    def account
      Tripletexer::Endpoints::Ledger::Account.new(api_client)
    end

    def accounting_period
      Tripletexer::Endpoints::Ledger::AccountingPeriod.new(api_client)
    end

    def annual_account
      Tripletexer::Endpoints::Ledger::AnnualAccount.new(api_client)
    end

    def close_group
      Tripletexer::Endpoints::Ledger::CloseGroup.new(api_client)
    end

    def posting
      Tripletexer::Endpoints::Ledger::Posting.new(api_client)
    end

    def vat_type
      Tripletexer::Endpoints::Ledger::VatType.new(api_client)
    end

    def voucher
      Tripletexer::Endpoints::Ledger::Voucher.new(api_client)
    end

    def type
      Tripletexer::Endpoints::Ledger::Type.new(api_client)
    end
  end
end
