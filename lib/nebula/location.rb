module Nebula
  class Location
    def initialize(client)
      @client = client
    end

    def all
      client.request(:get, '/Nebula/rest/localidades/')
    end

    private
    def client
      @client
    end
  end
end
