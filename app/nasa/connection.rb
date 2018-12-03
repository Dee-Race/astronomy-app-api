require 'faraday'
require 'json'

class Connection
  BASE_URL = 'https://api.nasa.gov/planetary/apod?api_key='

  def self.get_api_info
    Faraday.new(url: BASE_URL) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['NASA-Key'] = ENV['NASA_API_KEY']
    end
  end
end