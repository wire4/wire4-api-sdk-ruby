=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for Wire4Client::CertificateRequest
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'CertificateRequest' do
  before do
    # run before each test
    @instance = Wire4Client::CertificateRequest.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of CertificateRequest' do
    it 'should create an instance of CertificateRequest' do
      expect(@instance).to be_instance_of(Wire4Client::CertificateRequest)
    end
  end
  describe 'test attribute "_alias"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "certificate_number"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "check_digit"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "cipher_data"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end