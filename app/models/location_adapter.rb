class LocationAdapter
  require 'net/http'

  # base_uri = 'https://data.sfgov.org'
  # @json_endpoint = 'https://data.sfgov.org/resource/3ub7-d4yy.json'
  # @client = SODA::Client.new({:domain => "data.sfgov.org"})



  def initialize
    @popos_api_key = ENV['POPOS_KEY']
  end

  def request_ish(zip_code)
    url = URI('https://data.sfgov.org/resource/3ub7-d4yy.json')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-api-key"] = @popos_api_key
    request["the_geom_zip"] = zip_code
    request["cache-control"] = 'no-cache'

    response = http.request(request)
    return response.read_body
  end

end
