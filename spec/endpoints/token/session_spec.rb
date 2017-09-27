# frozen_string_literal: true

require 'web_helper'

RSpec.describe Tripletexer::Endpoints::Token::Session do

  describe '#create' do
    subject { Tripletexer.new.token.session }
    it 'creates new session and sets session_token for connection', vcr: 'endpoints/token/session/create' do
      response = subject.create(ENV['CONSUMER_SECRET'], ENV['EMPLOYEE_TOKEN'])
      expect( subject.send(:connection).session_token ).to eq response['token']
    end
  end

  describe '#whoami' do
    subject { Tripletexer.new(session_token: ENV['SESSION_TOKEN']).token.session }

    it 'returns info about session', vcr: 'endpoints/token/session/whoami' do
      expect( subject.whoami ).to eq("employeeId" => 1133333, "companyId" => 3795625)
    end
  end

  describe '#destroy' do
    subject { Tripletexer.new.token.session }
    it 'destroys session', vcr: 'endpoints/token/session/destroy' do
      expect { subject.whoami }.to raise_error ::Tripletexer::Errors::Unauthorized
      subject.create(ENV['CONSUMER_SECRET'], ENV['EMPLOYEE_TOKEN'])
      expect { subject.whoami }.to_not raise_error
      expect( subject.destroy ).to eq ''
      expect { subject.whoami }.to raise_error ::Tripletexer::Errors::Unauthorized
    end
  end
end
