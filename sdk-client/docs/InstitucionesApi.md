# Wire4Client::InstitucionesApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_all_institutions_using_get**](InstitucionesApi.md#get_all_institutions_using_get) | **GET** /institutions | Información de instituciones bancarias.


# **get_all_institutions_using_get**
> InstitutionsList get_all_institutions_using_get

Información de instituciones bancarias.

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::InstitucionesApi.new

begin
  #Información de instituciones bancarias.
  result = api_instance.get_all_institutions_using_get
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling InstitucionesApi->get_all_institutions_using_get: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InstitutionsList**](InstitutionsList.md)

### Authorization

[wire4_aut_app](../README.md#wire4_aut_app)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



