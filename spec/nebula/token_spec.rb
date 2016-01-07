require 'spec_helper'

RSpec.describe Nebula::Token do
  let(:client) { Nebula::Client.new(token: TOKEN, url: URL) }

  let(:attributes) do
    {
      tipo: '1',
      msj: 'foo',
      creadoPor: '1',
      empleado: {
        id: '1',
        nombre: 'John Doe',
        noCodificacion: '1',
        noEmpleado: '1',
        noEmpresa: '1',
        localidad: '1',
        curp: 'JDOE1'
      }
    }
  end

  describe '#create' do
    let(:token) { Nebula::Token.new(client) }

    it 'creates a token', :vcr do
      response = token.create(attributes)

      expect(response.keys).to match_array(['token', 'creado', 'status',
        'empleado', 'descripcion', 'codigoValidacion', 'actualiza', 'creadoPor',
        'tipo', 'fechaAprobacion']
      )
    end
  end

  describe '#status' do
    let(:token) { Nebula::Token.new(client) }

    it 'creates a token', :vcr do
      response = token.status('NX0000000002')

      expect(response.keys).to match_array(['descripcion', 'empleado', 'status'])
    end
  end
end
