=begin
#Wire4RestAPI

#Referencia de API. La API de Wire4 está organizada en torno a REST

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for Wire4Client::DepositantsResponse
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'DepositantsResponse' do
  before do
    # run before each test
    @instance = Wire4Client::DepositantsResponse.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of DepositantsResponse' do
    it 'should create an instance of DepositantsResponse' do
      expect(@instance).to be_instance_of(Wire4Client::DepositantsResponse)
    end
  end
  describe 'test attribute "clabe"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
