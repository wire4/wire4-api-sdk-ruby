# Wire4Client::WebhooksApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_webhook**](WebhooksApi.md#get_webhook) | **GET** /webhooks/{id} | Consulta de Webhook
[**get_webhooks**](WebhooksApi.md#get_webhooks) | **GET** /webhooks | Consulta de Webhooks
[**register_webhook**](WebhooksApi.md#register_webhook) | **POST** /webhooks | Alta de Webhook


# **get_webhook**
> WebhookResponse get_webhook(id)

Consulta de Webhook

Obtiene un webhook registrado en la plataforma mediante su identificador.

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::WebhooksApi.new

id = 'id_example' # String | Identificador del webhook


begin
  #Consulta de Webhook
  result = api_instance.get_webhook(id)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling WebhooksApi->get_webhook: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Identificador del webhook | 

### Return type

[**WebhookResponse**](WebhookResponse.md)

### Authorization

[wire4_aut_app](../README.md#wire4_aut_app)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_webhooks**
> WebhooksList get_webhooks

Consulta de Webhooks

Obtiene los webhooks registrados en la plataforma que tengan estatus 'ACTIVE' e 'INACTIVE'.

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::WebhooksApi.new

begin
  #Consulta de Webhooks
  result = api_instance.get_webhooks
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling WebhooksApi->get_webhooks: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**WebhooksList**](WebhooksList.md)

### Authorization

[wire4_aut_app](../README.md#wire4_aut_app)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **register_webhook**
> WebhookResponse register_webhook(webhook_request)

Alta de Webhook

Registra un webhook en la plataforma para su uso como notificador de eventos cuando estos ocurran.

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::WebhooksApi.new

webhook_request = Wire4Client::WebhookRequest.new # WebhookRequest | Información para registrar un Webhook


begin
  #Alta de Webhook
  result = api_instance.register_webhook(webhook_request)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling WebhooksApi->register_webhook: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **webhook_request** | [**WebhookRequest**](WebhookRequest.md)| Información para registrar un Webhook | 

### Return type

[**WebhookResponse**](WebhookResponse.md)

### Authorization

[wire4_aut_app](../README.md#wire4_aut_app)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



