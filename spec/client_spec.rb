# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Tripletexer::APIClient do
  describe '#connection' do
    it 'returns new Faraday connection' do
      expect( subject.connection ).to be_an_instance_of Faraday::Connection
    end

    context "when #session_token isn't set" do
      it 'returns new connection every time' do
        subject.session_token = nil
        expect( subject.connection.object_id ).to_not eq subject.connection.object_id
      end
    end

    context 'when #session_token is set' do
      it 'reuses connection' do
        subject.session_token = 'token'
        expect( subject.connection.object_id ).to eq subject.connection.object_id
      end
    end
  end

  describe '#reset_connection' do
    before do
      subject.session_token = 'token'
      subject.connection
    end

    it 'destroys session_token' do
      expect { subject.reset_connection }.to change { subject.session_token }.to(nil)
    end

    it 'destroys cached connection' do
      expect { subject.reset_connection }.to change { subject.connection.object_id }
    end
  end

  describe '#session_token=' do
    before do
      subject.session_token = 'token'
      subject.connection
    end

    it 'destroys cached connection' do
      expect { subject.session_token = 'new_token' }.to change { subject.connection.object_id }
    end

    it 'changes session token to given token' do
      expect { subject.session_token = 'new_token' }.to change { subject.session_token }.to('new_token')
    end
  end

end
