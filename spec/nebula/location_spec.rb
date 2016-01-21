require 'spec_helper'

RSpec.describe Nebula::Location do
  let(:client) { Nebula::Client.new(url: URL, token: TOKEN, base_path: BASE_PATH) }

  let(:locations) { Nebula::Location.new(client) }

  describe '#all' do

    it 'fetches locations', :vcr do
      response = locations.all

      expect(response[0]).to have_key('nombre')
    end
  end
end
