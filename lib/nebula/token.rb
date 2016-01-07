module Nebula
  class Token
    def initialize(client)
      @client = client
    end

    def create(params)
      client.request(:post, '/Nebula/rest/token/new', params)
    end

    def status(token)
      client.request(:get, "/Nebula/rest/token/status/#{token}")
    end

    private
    def client
      @client
    end
  end
end
