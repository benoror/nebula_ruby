require 'spec_helper'

RSpec.describe Nebula::Token do
  let(:client) { Nebula::Client.new(url: URL, token: TOKEN, base_path: BASE_PATH) }

  let(:attributes) do
    {
      tipo: '1',
      msj: 'Prueba',
      creadoPor: '3',
      prestadorServicios: 'Prueba',
      diagnostico: '001',
      # docSolicitaIncapacidad: 'CEDULA'
      # diasIncapacidad: 0
      empleado: {
        curp: 'MEEP12345678901234',
        noCodificacion: '0',
        noEmpleado: '999',
        noEmpresa: '10',
        nombre: 'Sir Meepington The Third',
        localidad: 'Localidad 01'
      }
    }
  end

  describe '#create' do
    let(:token) { Nebula::Token.new(client) }

    it 'creates a token', :vcr do
      response = token.create(attributes)

      expect(response.keys).to match_array([
        'token',
        'creado',
        'status',
        'empleado',
        'descripcion',
        'codigoValidacion',
        'actualiza',
        'app',
        'creadoPor',
        'tipo',
        'fechaAprobacion',
        'diagnostico',
        'diasIncapacidad',
        'prestadorServicios'
      ])
    end
  end

  describe '#status' do
    let(:token) { Nebula::Token.new(client) }

    it 'gets status of token', :vcr do
      response = token.status('0000000697')

      expect(response.keys).to match_array([
        'status',
        'codigoAprobacion',
        'empleado',
        'descripcion',
        'diagnostico',
        'tipo'
      ])
    end
  end
end
