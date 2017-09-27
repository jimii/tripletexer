# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Tripletexer::Endpoints::Timesheet do
  subject { Tripletexer.new.timesheet }

  describe "#entry" do
    it 'returns token/consumer endpoint' do
      expect( subject.entry ).to be_an_instance_of ::Tripletexer::Endpoints::Timesheet::Entry
    end
  end

  describe "#time_clock" do
    it 'returns token/time_clock endpoint' do
      expect( subject.time_clock ).to be_an_instance_of ::Tripletexer::Endpoints::Timesheet::TimeClock
    end
  end
end
