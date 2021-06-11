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

# Unit tests for Wire4Client::SubscriptionChangeStatusRequest
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'SubscriptionChangeStatusRequest' do
  before do
    # run before each test
    @instance = Wire4Client::SubscriptionChangeStatusRequest.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SubscriptionChangeStatusRequest' do
    it 'should create an instance of SubscriptionChangeStatusRequest' do
      expect(@instance).to be_instance_of(Wire4Client::SubscriptionChangeStatusRequest)
    end
  end
  describe 'test attribute "status"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["ACTIVE", "INACTIVE"])
      # validator.allowable_values.each do |value|
      #   expect { @instance.status = value }.not_to raise_error
      # end
    end
  end

end
