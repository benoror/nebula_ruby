module Nebula
  class Location
    def initialize(client)
      @client = client
    end

    def all
      client.request(:get, '/localidades/')
    end

    private
    def client
      @client
    end
  end
end
