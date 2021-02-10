# Wire4Client::WebhooksApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_webhook**](WebhooksApi.md#get_webhook) | **GET** /webhooks/{webhook_id} | Consulta de Webhook
[**get_webhooks**](WebhooksApi.md#get_webhooks) | **GET** /webhooks | Consulta la lista de Webhooks
[**register_webhook**](WebhooksApi.md#register_webhook) | **POST** /webhooks | Alta de Webhook


# **get_webhook**
> WebhookResponse get_webhook(authorization, webhook_id)

Consulta de Webhook

Obtiene un webhook registrado en la plataforma mediante su identificador.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::WebhooksApi.new

authorization = 'authorization_example' # String | Header para token

webhook_id = 'webhook_id_example' # String | Es el identificador del webhook. Ejemplo: wh_54a932866f784b439bc625c0f4e04e12


begin
  #Consulta de Webhook
  result = api_instance.get_webhook(authorization, webhook_id)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling WebhooksApi->get_webhook: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **webhook_id** | **String**| Es el identificador del webhook. Ejemplo: wh_54a932866f784b439bc625c0f4e04e12 | 

### Return type

[**WebhookResponse**](WebhookResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_webhooks**
> WebhooksList get_webhooks(authorization)

Consulta la lista de Webhooks

Obtiene una lista de los webhooks registrados en la plataforma que tengan el estado (estatus)  Activo (ACTIVE) e Inactivo (INACTIVE).

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::WebhooksApi.new

authorization = 'authorization_example' # String | Header para token


begin
  #Consulta la lista de Webhooks
  result = api_instance.get_webhooks(authorization)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling WebhooksApi->get_webhooks: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 

### Return type

[**WebhooksList**](WebhooksList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **register_webhook**
> WebhookResponse register_webhook(authorization, webhook_request)

Alta de Webhook

Registra un webhook en la plataforma para su uso como notificador de eventos, cuándo estos ocurran.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::WebhooksApi.new

authorization = 'authorization_example' # String | Header para token

webhook_request = Wire4Client::WebhookRequest.new # WebhookRequest | Información para registrar un Webhook


begin
  #Alta de Webhook
  result = api_instance.register_webhook(authorization, webhook_request)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling WebhooksApi->register_webhook: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **webhook_request** | [**WebhookRequest**](WebhookRequest.md)| Información para registrar un Webhook | 

### Return type

[**WebhookResponse**](WebhookResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



