=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'spec_helper'
require 'json'

# Unit tests for Wire4Client::ContactoApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'ContactoApi' do
  before do
    # run before each test
    @instance = Wire4Client::ContactoApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ContactoApi' do
    it 'should create an instance of ContactoApi' do
      expect(@instance).to be_instance_of(Wire4Client::ContactoApi)
    end
  end

  # unit tests for send_contact_using_post
  # Solicitud de contacto
  # Notifica a un asesor Monex para que se ponga en contacto con un posible cliente.
  # @param authorization Header para token
  # @param request_dto Información del contacto
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'send_contact_using_post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
