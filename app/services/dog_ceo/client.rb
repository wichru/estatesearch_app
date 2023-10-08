# frozen_string_literal: true

require 'faraday'

module DogCeo
  class Client
    def initialize
      @conn = setup_conn(Rails.application.config.dog_ceo.api_url)
    end

    def breeds_show(name)
      Dog.new(handle_response(@conn.get("breed/#{name}/images/random")))
    end

    private

    def handle_response(response, parser: ->(resp) { JSON.parse(resp.body) })
      case response.status
      when 200..299
        parser.call(response)
      else
        raise ::DogCeo::Error, parse_error(response.body)
      end
    end

    def parse_error(response_body) = JSON.parse(response_body)['message']

    def setup_conn(url)
      headers = { 'Content-Type' => 'application/json' }
      Faraday.new(url:, headers:) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger, nil, headers: { request: false, response: false },
                                       bodies: { request: true, response: false }
        faraday.adapter Faraday.default_adapter # make requests with Net::HTT
      end
    end
  end
end
