module Nebula
  class Provider
    def initialize(client)
      @client = client
    end

    def all
      client.request(:get, '/prestadoresSalud/')
    end

    private
    def client
      @client
    end
  end
end
