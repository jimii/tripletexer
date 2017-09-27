# frozen_string_literal: true

require 'web_helper'

RSpec.describe Tripletexer::Endpoints::Order do
  subject { Tripletexer.new(session_token: ENV['SESSION_TOKEN']).order }

  describe '#search' do
    it 'returns enumerator', vcr: 'endpoints/order/search' do
      response = subject.search(Date.new(2017), Date.new(2018, 9, 26))
      expect( response ).to be_an_instance_of Enumerator
    end

    it 'returns two orders', vcr: 'endpoints/order/search' do
      response = subject.search(Date.new(2017), Date.new(2018, 9, 26)).to_a
      expect( response.size ).to eq 2
      expect( response[0]['id'] ).to eq 23432678
    end
  end

  describe '#create' do
    it 'has no test yet'
  end

  describe '#find' do
    it 'returns order with given id', vcr: 'endpoints/order/find' do
      response = subject.find(23432678)
      expect( response ).to include('id' => 23432678)
    end

    it 'raises Tripletexer::Errors::Unauthorized when user has no access to order', vcr: 'endpoints/order/find__unauthorized' do
      expect { subject.find(23432677) }.to raise_error Tripletexer::Errors::Unauthorized
    end
  end

  describe '#create_invoice' do
    it 'has no test yet'
  end

  describe 'orderline' do
    it 'returns order/orderline endpoint' do
      expect( subject.orderline ).to be_an_instance_of ::Tripletexer::Endpoints::Order::Orderline
    end
  end

end
