class GiphyAdapter
  include HTTParty

  base_uri 'api.giphy.com'

  def initialize
    @api_key = ENV['GIPHY_KEY']
  end

  def search(search_string)
    response = self.class.get("/v1/gifs/search",
                    {query: {
                      q: search_string,
                      api_key: @api_key,
                      limit: 3
                      }
                      })

    response["data"].map { |result| result["images"]["fixed_height"]["url"]}
  end

end
