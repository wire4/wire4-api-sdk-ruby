# Wire4Client::InstitucionesApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_all_institutions_using_get**](InstitucionesApi.md#get_all_institutions_using_get) | **GET** /institutions | Información de instituciones bancarias.


# **get_all_institutions_using_get**
> InstitutionsList get_all_institutions_using_get(authorization)

Información de instituciones bancarias.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::InstitucionesApi.new

authorization = 'authorization_example' # String | Header para token


begin
  #Información de instituciones bancarias.
  result = api_instance.get_all_institutions_using_get(authorization)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling InstitucionesApi->get_all_institutions_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 

### Return type

[**InstitutionsList**](InstitutionsList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



