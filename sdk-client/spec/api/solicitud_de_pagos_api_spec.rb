=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'spec_helper'
require 'json'

# Unit tests for Wire4Client::SolicitudDePagosApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'SolicitudDePagosApi' do
  before do
    # run before each test
    @instance = Wire4Client::SolicitudDePagosApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SolicitudDePagosApi' do
    it 'should create an instance of SolicitudDePagosApi' do
      expect(@instance).to be_instance_of(Wire4Client::SolicitudDePagosApi)
    end
  end

  # unit tests for register_payment_request_using_post
  # Registro de solicitud de pagos
  #  Se registra una solicitud de pagos. En la respuesta se proporcionará una dirección URL que lo llevará al sitio donde se le solicitará ingresar los datos de tarjeta a la que se aplicarán los cargos.
  # @param authorization Header para token
  # @param payment_request_req_dto Información de la solicitud de pagos
  # @param [Hash] opts the optional parameters
  # @return [PaymentRequestResponse]
  describe 'register_payment_request_using_post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end