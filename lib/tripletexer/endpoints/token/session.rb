# frozen_string_literal: true

module Tripletexer::Endpoints
  class Token::Session < AbstractEndpoint
    DAY_IN_SECONDS = 24 * 60 * 60

    # https://tripletex.no/v2-docs/#!/token47session/create
    def create(consumer_token, employee_token, expiration_date: Time.now.utc + DAY_IN_SECONDS)
      response = put('/v2/token/session/:create') do |req|
        req.params = {
          'consumerToken' => consumer_token,
          'employeeToken' => employee_token,
          'expirationDate' => ::Tripletexer::FormatHelpers.format_date(expiration_date)
        }
      end
      connection.session_token = response.dig('value', 'token')
      response['value']
    end

    # https://tripletex.no/v2-docs/#!/token47session/whoAmI
    def whoami
      find_entity('/v2/token/session/>whoAmI')
    end

    # https://tripletex.no/v2-docs/#!/token47session/delete
    def destroy(session_token = connection.session_token)
      response = delete("/v2/token/session/#{session_token}")
      connection.reset
      response
    end
  end
end
