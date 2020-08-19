=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'spec_helper'
require 'json'

# Unit tests for Wire4Client::SaldoApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'SaldoApi' do
  before do
    # run before each test
    @instance = Wire4Client::SaldoApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SaldoApi' do
    it 'should create an instance of SaldoApi' do
      expect(@instance).to be_instance_of(Wire4Client::SaldoApi)
    end
  end

  # unit tests for get_balance_using_get
  # Consulta los saldo de una cuenta
  # Obtiene el de las divisas que se manejen en el contrato.
  # @param authorization Header para token
  # @param subscription El identificador de la suscripción a esta API
  # @param [Hash] opts the optional parameters
  # @return [BalanceListResponse]
  describe 'get_balance_using_get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
