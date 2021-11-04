# wire4_sdk

Wire4SDK - gems (gemas) de Ruby para el API de Wire4

Referencia del SDK para el consumo del API de Wire4

Este SDK es hecho y distrubuido por Wire4:

- Versión del API de Wire4: 1.0.0
- Versión del paquete SDK: 1.1.2

## Instalación

Para la instalación utilizando [RubyGems](https://rubygems.org/), usamos el siguiente comando
```shell
gem install wire4_auth
```

### Instalar usando Git

Para instalar desde el repositorio agregamos en el 'Gemfile':

    gem 'wire4_client', :git => 'https://github.com/wire4/wire4-api-sdk-ruby#subdirectory=sdk-client'
    gem 'wire4_auth', :git => 'https://github.com/wire4/wire4-api-sdk-ruby#subdirectory=authenticator'


## Instalación Manual

Para una instalación manual a partir de los fuentes, es necesario seguir los siguientes pasos despues de clonar el repositorio.

### Construir (build) el gem

Para convertir el código en Ruby a un gem, usamos los siguientes comandos

Para generar el client:

```shell
gem build wire4_client.gemspec
```

Para generar el autenticador:

```shell
gem build wire4_auth.gemspec
```

Después podemos instalar el gem localmente. Para instalar el client:

```shell
gem install ./wire4_client-1.0.5.gem
```
(para entornos de desarrollo, run `gem install --dev ./wire4_client-1.0.5.gem` esto instalará las dependencias para desarrollo)

Para instalar el autenticador:

```shell
gem install ./wire4_auth-1.0.5.gem
```
(para entornos de desarrollo, run `gem install --dev ./wire4_auth-1.0.5.gem` esto instalará las dependencias para desarrollo)


Finalmente agregamos los gems a nuestro 'Gemfile':

    gem 'wire4_client', '~> 1.0', '>= 1.0.5'
    gem 'wire4_auth', '~> 1.0', '>= 1.0.5'

## Para comenzar a usar

Primero debes seguir la guía de [instalación](#installation) y ejecutar el siguiente código:
```ruby
# Load the gems
require 'wire4_client'
require 'wire4_auth'

CLIENT_ID = "FxUWmqYGZuv8O1qjxstvIyJothMa"

CLIENT_SECRET = "kjwbkrPVgXsnaUGzthj55dsFhx4a"

oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)
oauth_wire4.config_default_api_client
authorization = oauth_wire4.obtain_access_token_app('general')
api_instance = Wire4Client::ComprobanteElectrnicoDePagoCEPApi.new

cep_data = Wire4Client::CepSearchBanxico.new # CepSearchBanxico | Información para buscar un CEP
cep_data.amount = 8963.25
cep_data.beneficiary_account = '072680004657656853'
cep_data.beneficiary_bank_key = '40072'
cep_data.clave_rastreo = '58735618'
cep_data.operation_date = '05-12-2018'
cep_data.reference = '1122334'
cep_data.sender_account = '112680000156896531'
cep_data.sender_bank_key = '40112'

begin
  #Consulta de CEP
  result = api_instance.obtain_transaction_cep_using_post(authorization, cep_data)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling ComprobanteElectrnicoDePagoCEPApi->obtain_transaction_cep_using_post: #{e}"
end
```
