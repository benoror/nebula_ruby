require 'spec_helper'

RSpec.describe Nebula::Provider do
  let(:client) { Nebula::Client.new(url: URL, token: TOKEN, base_path: BASE_PATH) }

  let(:providers) { Nebula::Provider.new(client) }

  describe '#all' do

    it 'fetches providers', :vcr do
      response = providers.all

      expect(response[0]).to have_key('nombre')
    end
  end
end
