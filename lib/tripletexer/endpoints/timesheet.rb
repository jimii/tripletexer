# frozen_string_literal: true

module Tripletexer::Endpoints
  class Timesheet < AbstractEndpoint
    def entry
      Tripletexer::Endpoints::Timesheet::Entry.new(api_client)
    end

    def time_clock
      Tripletexer::Endpoints::Timesheet::TimeClock.new(api_client)
    end
  end
end
