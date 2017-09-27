# frozen_string_literal: true

module Tripletexer::Endpoints
  class Ledger::Voucher < AbstractEndpoint

    # https://tripletex.no/v2-docs/#!/ledger47voucher/search
    def search(date_from, date_to, params = {})
      final_params = params.merge(
        'invoiceDateFrom' => ::Tripletexer::FormatHelpers.format_date(date_from),
        'invoiceDateTo' => ::Tripletexer::FormatHelpers.format_date(date_to)
      )
      find_entities('/v2/ledger/voucher', final_params)
    end

    # https://tripletex.no/v2-docs/#!/ledger47voucher/post
    def create(send_to_ledger, body)
      create_entity('/v2/ledger/voucher', body, { 'sendToLedger' => send_to_ledger.to_s })
    end

    # https://tripletex.no/v2-docs/#!/ledger47voucher/get
    def find(id, params = {})
      find_entity("/v2/ledger/voucher/#{id}", params)
    end

    # https://tripletex.no/v2-docs/#!/ledger47voucher/put
    def update(id, send_to_ledger, body)
      update_entity("/v2/ledger/voucher/#{id}", body, { 'sendToLedger' => send_to_ledger.to_s })
    end

    # https://tripletex.no/v2-docs/#!/ledger47voucher/downloadPdf
    def download_pdf(id)
      get("/v2/ledger/voucher/#{id}/pdf")
    end

    # https://tripletex.no/v2-docs/#!/ledger47voucher/uploadPdf
    def upload_pdf(_id, _filename, _file)
      raise NotImplementedError
    end
  end
end
