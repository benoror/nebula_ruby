require 'spec_helper'

RSpec.describe Nebula::Token do
  let(:client) { Nebula::Client.new(url: URL, token: TOKEN) }

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
        curp: 'JDOE1',
        noCodificacion: '1',
        noEmpleado: '1',
        noEmpresa: '1',
        nombre: 'John Doe',
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
      response = token.status('NX0000000511')

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
