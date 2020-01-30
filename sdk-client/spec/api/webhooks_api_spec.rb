=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'spec_helper'
require 'json'

# Unit tests for Wire4Client::WebhooksApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'WebhooksApi' do
  before do
    # run before each test
    @instance = Wire4Client::WebhooksApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of WebhooksApi' do
    it 'should create an instance of WebhooksApi' do
      expect(@instance).to be_instance_of(Wire4Client::WebhooksApi)
    end
  end

  # unit tests for get_webhook
  # Consulta de Webhook
  # Obtiene un webhook registrado en la plataforma mediante su identificador.
  # @param authorization Header para token
  # @param id Identificador del webhook
  # @param [Hash] opts the optional parameters
  # @return [WebhookResponse]
  describe 'get_webhook test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_webhooks
  # Consulta de Webhooks
  # Obtiene los webhooks registrados en la plataforma que tengan estatus &#39;ACTIVE&#39; e &#39;INACTIVE&#39;.
  # @param authorization Header para token
  # @param [Hash] opts the optional parameters
  # @return [WebhooksList]
  describe 'get_webhooks test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for register_webhook
  # Alta de Webhook
  # Registra un webhook en la plataforma para su uso como notificador de eventos cuando estos ocurran.
  # @param authorization Header para token
  # @param webhook_request Información para registrar un Webhook
  # @param [Hash] opts the optional parameters
  # @return [WebhookResponse]
  describe 'register_webhook test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
