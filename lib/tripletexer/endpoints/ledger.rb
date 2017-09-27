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
      Tripletexer::Endpoints::Ledger::Account.new(connection)
    end

    def accounting_period
      Tripletexer::Endpoints::Ledger::AccountingPeriod.new(connection)
    end

    def annual_account
      Tripletexer::Endpoints::Ledger::AnnualAccount.new(connection)
    end

    def close_group
      Tripletexer::Endpoints::Ledger::CloseGroup.new(connection)
    end

    def posting
      Tripletexer::Endpoints::Ledger::Posting.new(connection)
    end

    def vat_type
      Tripletexer::Endpoints::Ledger::VatType.new(connection)
    end

    def voucher
      Tripletexer::Endpoints::Ledger::Voucher.new(connection)
    end

    def type
      Tripletexer::Endpoints::Ledger::Type.new(connection)
    end
  end
end
