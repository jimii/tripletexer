# frozen_string_literal: true

module Tripletexer::Endpoints
  class Token < AbstractEndpoint
    def consumer
      ::Tripletexer::Endpoints::Token::Consumer.new(api_client)
    end

    def session
      ::Tripletexer::Endpoints::Token::Session.new(api_client)
    end
  end
end
