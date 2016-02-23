require 'spec_helper'

RSpec.describe Nebula::Client do
  let(:client) { Nebula::Client.new(url: URL, token: TOKEN, base_path: BASE_PATH) }
  let(:token) { Nebula::Token.new(client) }
  let(:attributes) do
    {
      tipo: '1',
      msj: 'Prueba',
      creadoPor: '3',
      prestadorServicios: 'Prueba',
      diagnostico: '001',
      empleado: { }
    }
  end

  it 'catches HTTP 500 errors', :vcr do
    expect{ token.create(attributes) }.to raise_error(Faraday::ClientError,
      'the server responded with status 500')
  end
end
