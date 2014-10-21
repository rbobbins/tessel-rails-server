module Requests
  module JsonHelpers
    def response_json
      @json ||= JSON.parse(response.body)
    end
  end
end