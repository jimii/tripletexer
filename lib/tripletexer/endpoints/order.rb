# frozen_string_literal: true

module Tripletexer::Endpoints
  class Order < AbstractEndpoint

    # https://tripletex.no/v2-docs/#!/order/search
    def search(date_from, date_to, params = {})
      final_params = params.merge(
        'orderDateFrom' => ::Tripletexer::FormatHelpers.format_date(date_from),
        'orderDateTo' => ::Tripletexer::FormatHelpers.format_date(date_to)
      )
      find_entities('/v2/order', final_params)
    end

    # https://tripletex.no/v2-docs/#!/order/post
    def create(body)
      create_entity('/v2/order', body)
    end

    # https://tripletex.no/v2-docs/#!/order/get
    def find(id, params = {})
      find_entity("/v2/order/#{id}", params)
    end

    # https://tripletex.no/v2-docs/#!/order/put
    def update(id, body)
      update_entity("/v2/order/#{id}", body)
    end

    # https://tripletex.no/v2-docs/#!/order/invoice
    def create_invoice(id, invoice_date, send_to_customer = true, params = {})
      invoice_date = ::Tripletexer::FormatHelpers.format_date(invoice_date)
      api_client.put("/v2/order/#{id}/:invoice?invoiceDate=#{invoice_date}&sendToCustomer=#{send_to_customer.to_s}")
    end

    def orderline
      ::Tripletexer::Endpoints::Order::Orderline.new(api_client)
    end
  end
end
