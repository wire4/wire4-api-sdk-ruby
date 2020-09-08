=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'spec_helper'
require 'json'

# Unit tests for Wire4Client::EmpresasCoDiApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'EmpresasCoDiApi' do
  before do
    # run before each test
    @instance = Wire4Client::EmpresasCoDiApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of EmpresasCoDiApi' do
    it 'should create an instance of EmpresasCoDiApi' do
      expect(@instance).to be_instance_of(Wire4Client::EmpresasCoDiApi)
    end
  end

  # unit tests for obtain_companies
  # Consulta de empresas CODI
  # Consulta de empresas CODI registradas para la aplicación.
  # @param authorization Header para token
  # @param [Hash] opts the optional parameters
  # @return [Array<CompanyRegistered>]
  describe 'obtain_companies test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for register_company_using_post
  # Registro de empresas CODI
  # Registra una empresa para hacer uso de operaciones CODI. Es requerido tener el certificado emitido por BANXICO® asi como el Nombre de la empresa, Nombre comercial y RFC de la empresa.&lt;br/&gt;
  # @param authorization Header para token
  # @param request_dto Información de la cuenta del beneficiario
  # @param [Hash] opts the optional parameters
  # @return [CompanyRegistered]
  describe 'register_company_using_post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end