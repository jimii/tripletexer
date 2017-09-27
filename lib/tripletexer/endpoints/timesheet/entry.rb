# frozen_string_literal: true

module Tripletexer::Endpoints
  class Timesheet::Entry < AbstractEndpoint

    # https://tripletex.no/v2-docs/#!/timesheet47entry/search
    def search(from_date, to_date, params = {})
      final_params = params.merge(
        'dateFrom' => ::Tripletexer::FormatHelpers.format_date(from_date),
        'dateTo' => ::Tripletexer::FormatHelpers.format_date(to_date)
      )
      find_entities('/v2/timesheet/entry', final_params)
    end

    # https://tripletex.no/v2-docs/#!/timesheet47entry/post
    def create(body)
      create_entity('/v2/timesheet/entry', body)
    end

    # https://tripletex.no/v2-docs/#!/timesheet47entry/getRecentActivities
    def get_recent_activities(project_id, params = {})
      final_params = params.merge(
        'projectId' => project_id
      )
      find_entities('/v2/timesheet/entry/>recentActivities', final_params)
    end

    # https://tripletex.no/v2-docs/#!/timesheet47entry/getRecentProjects
    def get_recent_projects(params = {})
      find_entities('/v2/timesheet/entry/>recentProjects', params)
    end

    # https://tripletex.no/v2-docs/#!/timesheet47entry/getTotalHours
    def get_total_hours(params = {})
      find_entity('/v2/timesheet/entry/>totalHours', params)
    end

    # https://tripletex.no/v2-docs/#!/timesheet47entry/postList
    def create_list(body)
      create_entities('/v2/timesheet/entry/list', body)
    end

    # https://tripletex.no/v2-docs/#!/timesheet47entry/putList
    def update_list(body)
      update_entities('/v2/timesheet/entry/list', body)
    end

    # https://tripletex.no/v2-docs/#!/timesheet47entry/delete
    def destroy(id, params = {})
      delete("/v2/timesheet/entry/#{id}", params)
    end

    # https://tripletex.no/v2-docs/#!/timesheet47entry/get
    def find(id, params = {})
      find_entity("/v2/timesheet/entry/#{id}", params)
    end

    # https://tripletex.no/v2-docs/#!/timesheet47entry/put
    def update(id, body)
      update_entity("/v2/timesheet/entry/#{id}", body)
    end

  end
end
