=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'spec_helper'
require 'json'

# Unit tests for Wire4Client::InstitucionesApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'InstitucionesApi' do
  before do
    # run before each test
    @instance = Wire4Client::InstitucionesApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of InstitucionesApi' do
    it 'should create an instance of InstitucionesApi' do
      expect(@instance).to be_instance_of(Wire4Client::InstitucionesApi)
    end
  end

  # unit tests for get_all_institutions_using_get
  # Consulta de instituciones bancarias
  # Se obtiene un listado de las instituciones bancarias y la información de cada una de estas.
  # @param authorization Header para token
  # @param [Hash] opts the optional parameters
  # @return [InstitutionsList]
  describe 'get_all_institutions_using_get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
