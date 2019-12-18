# Wire4Client::ContactoApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**send_contact_using_post**](ContactoApi.md#send_contact_using_post) | **POST** /contact | Solicitud de contacto


# **send_contact_using_post**
> send_contact_using_post(request_dto)

Solicitud de contacto

Notifica a un asesor Monex para que se ponga en contacto con un posible cliente.

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::ContactoApi.new

request_dto = Wire4Client::ContactRequest.new # ContactRequest | Información del contacto


begin
  #Solicitud de contacto
  api_instance.send_contact_using_post(request_dto)
rescue Wire4Client::ApiError => e
  puts "Exception when calling ContactoApi->send_contact_using_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request_dto** | [**ContactRequest**](ContactRequest.md)| Información del contacto | 

### Return type

nil (empty response body)

### Authorization

[wire4_aut_app](../README.md#wire4_aut_app)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



