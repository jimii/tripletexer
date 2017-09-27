# frozen_string_literal: true

module Tripletexer::Endpoints
  class Timesheet::TimeClock < AbstractEndpoint

    # https://tripletex.no/v2-docs/#!/timesheet47timeClock/search
    def search(params = {})
      find_entities('/v2/timesheet/timeClock', params)
    end

    # https://tripletex.no/v2-docs/#!/timesheet47timeClock/start
    def start(activity_id, params = {})
      final_params = params.merge(
        'activityId' => activity_id
      )
      api_client.put('/timesheet/timeClock/:start', final_params)
    end

    # https://tripletex.no/v2-docs/#!/timesheet47timeClock/getPresent
    def present(params = {})
      find_entity('/timesheet/timeClock/present', params)
    end

    # https://tripletex.no/v2-docs/#!/timesheet47timeClock/get
    def find(id, params = {})
      find_entity("/timesheet/timeClock/#{id}", params)
    end

    # https://tripletex.no/v2-docs/#!/timesheet47timeClock/put
    def update(id, body)
      update_entity("/timesheet/timeClock/#{id}", body)
    end

    # https://tripletex.no/v2-docs/#!/timesheet47timeClock/stop
    def stop(id, params = {})
      api_client.put("/timesheet/timeClock/#{id}/:stop", params)
    end
  end
end
