require 'spec_helper'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock
end

RSpec.configure do |config|
  config.around(:each) do |example|
    if cassette = example.metadata[:vcr]
      VCR.use_cassette(cassette, erb: true) do
        example.run
      end
    else
      example.run
    end
  end
end
