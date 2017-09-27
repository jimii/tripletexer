# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Tripletexer::Endpoints::Token do
  subject { Tripletexer.new.token }

  describe "#consumer" do
    it 'returns token/consumer endpoint' do
      expect( subject.consumer ).to be_an_instance_of ::Tripletexer::Endpoints::Token::Consumer
    end
  end

  describe "#session" do
    it 'returns token/session endpoint' do
      expect( subject.session ).to be_an_instance_of ::Tripletexer::Endpoints::Token::Session
    end
  end
end
