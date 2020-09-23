=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'spec_helper'
require 'json'

# Unit tests for Wire4Client::PuntosDeVentaCoDiApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'PuntosDeVentaCoDiApi' do
  before do
    # run before each test
    @instance = Wire4Client::PuntosDeVentaCoDiApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of PuntosDeVentaCoDiApi' do
    it 'should create an instance of PuntosDeVentaCoDiApi' do
      expect(@instance).to be_instance_of(Wire4Client::PuntosDeVentaCoDiApi)
    end
  end

  # unit tests for create_sales_point
  # Registra un punto de venta asociado a una empresa
  # Registra un punto de venta desde donde se emitaran los cobros CODI®, el punto de venta se debe asociar a un cuenta cableregistrada previamente ante Banxico para realizar cobros con CODI®
  # @param authorization Header para token
  # @param company_id El identificador de la empresa
  # @param sales_point_info Información del punto de venta CODI®
  # @param [Hash] opts the optional parameters
  # @return [SalesPointRespose]
  describe 'create_sales_point test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for obtain_sale_points
  # Obtiene los puntos de venta asociados a una empresa
  # Obtiene los puntos de venta asociados a una empresa en las cuales se hacen operaciones CODI®
  # @param authorization Header para token
  # @param company_id El identificador de la empresa
  # @param [Hash] opts the optional parameters
  # @return [Array<SalesPointFound>]
  describe 'obtain_sale_points test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
