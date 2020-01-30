# Wire4Client::ContactoApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**send_contact_using_post**](ContactoApi.md#send_contact_using_post) | **POST** /contact | Solicitud de contacto


# **send_contact_using_post**
> send_contact_using_post(authorization, request_dto)

Solicitud de contacto

Notifica a un asesor Monex para que se ponga en contacto con un posible cliente.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::ContactoApi.new

authorization = 'authorization_example' # String | Header para token

request_dto = Wire4Client::ContactRequest.new # ContactRequest | Información del contacto


begin
  #Solicitud de contacto
  api_instance.send_contact_using_post(authorization, request_dto)
rescue Wire4Client::ApiError => e
  puts "Exception when calling ContactoApi->send_contact_using_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **request_dto** | [**ContactRequest**](ContactRequest.md)| Información del contacto | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



