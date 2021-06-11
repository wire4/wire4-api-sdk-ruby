=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'spec_helper'
require 'json'

# Unit tests for Wire4Client::PeticionesDePagoPorCoDiApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'PeticionesDePagoPorCoDiApi' do
  before do
    # run before each test
    @instance = Wire4Client::PeticionesDePagoPorCoDiApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of PeticionesDePagoPorCoDiApi' do
    it 'should create an instance of PeticionesDePagoPorCoDiApi' do
      expect(@instance).to be_instance_of(Wire4Client::PeticionesDePagoPorCoDiApi)
    end
  end

  # unit tests for consult_codi_request_by_order_id
  # Consulta información de petición por orderId
  # Obtiene la información de una petición de pago CODI® por orderId para un punto de venta.
  # @param authorization Header para token
  # @param order_id Identificador del pago CODI®
  # @param sales_point_id Identificador del punto de venta
  # @param [Hash] opts the optional parameters
  # @return [PaymentRequestCodiResponseDTO]
  describe 'consult_codi_request_by_order_id test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for generate_codi_code_qr
  # Genera código QR
  # Genera un código QR solicitado por un punto de venta para un pago mediante CODI®
  # @param authorization Header para token
  # @param codi_info Información del pago CODI®
  # @param sales_point_id Identificador del punto de venta
  # @param [Hash] opts the optional parameters
  # @return [CodiCodeQrResponseDTO]
  describe 'generate_codi_code_qr test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
