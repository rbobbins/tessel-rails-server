module Requests
  module JsonHelpers
    def response_json
      @json ||= JSON.parse(response.body)
    end

    def post_json(url, request_params)
		post url, request_params.to_json, {'CONTENT_TYPE' => "application/json", 'ACCEPT' => 'application/json'}
    end
  end
end