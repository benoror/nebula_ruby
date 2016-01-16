# Nebula Ruby Gem

A Ruby wrapper for the Nebula API.

You should access the Nebula API documentation in order to learn more about the
request/response parameters for each endpoint.

## Installation

```
$ gem install nebula_ruby
```

Or if you are using Bundler, add

````
gem 'nebula_ruby'
```

## API Usage Examples

You will need to get an access token. Once you have it, initialize the client
to make authenticated calls.

```ruby
require 'nebula'

client = Nebula::Client.new(token: '<redacted>', url: '<redacted>')
```

### Tokens

Create a token.

```ruby
attributes = {
  empleado: {
    curp: 'SIFU123',
    noEmpleado: '123',
    noEmpresa: '123',
    noCodificacion: '1',
    nombre: 'Sifu de la Rosa',
    localidad: 'Localidad 01'
  },
  tipo: '1',
  creadoPor: '3',
  msj: 'Para una cita X'
  diagnostico: '000',
  prestadorServicios: 'Prueba'
}

token = Nebula::Token.new(client)
token.create(attributes)
```

Retrieve existing token status

```ruby
response = token.status('X0123456')
response['status']
```

### Location

Retrieve location list

```ruby
locations = Nebula::Location.new(client)
locations.all
```

### Provider

Retrieve providers list

```ruby
providers = Nebula::Provider.new(client)
providers.all
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
