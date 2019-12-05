# frozen_string_literal: true

class Tripletexer::Configuration
  attr_accessor :api_url

  def initialize
    @api_url = 'https://tripletex.no/'
  end
end
