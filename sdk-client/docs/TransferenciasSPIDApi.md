# Wire4Client::TransferenciasSPIDApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_spid_classifications_using_get**](TransferenciasSPIDApi.md#get_spid_classifications_using_get) | **GET** /subscriptions/{subscription}/beneficiaries/spid/classifications | Consulta de clasificaciones para operaciones SPID®
[**register_outgoing_spid_transaction_using_post**](TransferenciasSPIDApi.md#register_outgoing_spid_transaction_using_post) | **POST** /subscriptions/{subscription}/transactions/outcoming/spid | Registro de transferencias SPID®


# **get_spid_classifications_using_get**
> SpidClassificationsResponseDTO get_spid_classifications_using_get(authorization, subscription)

Consulta de clasificaciones para operaciones SPID®

Obtiene las clasificaciones para operaciones con dólares (SPID®) de Monex.<br/><br/>Este recurso se debe invocar previo al realizar una operación SPID.<br/><br/>

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPIDApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.


begin
  #Consulta de clasificaciones para operaciones SPID®
  result = api_instance.get_spid_classifications_using_get(authorization, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling TransferenciasSPIDApi->get_spid_classifications_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 

### Return type

[**SpidClassificationsResponseDTO**](SpidClassificationsResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **register_outgoing_spid_transaction_using_post**
> TokenRequiredResponse register_outgoing_spid_transaction_using_post(authorization, subscription, transactions)

Registro de transferencias SPID®

Registra un conjunto de transferencias a realizar en la cuenta del cliente Monex relacionada a la suscripción. En la respuesta se proporcionará una dirección URL que lo llevará al centro de autorización para que las transferencias sean confirmadas (autorizadas) por el cliente para que se efectúen, para ello debe ingresar la llave electrónica (Token).

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPIDApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.

transactions = Wire4Client::TransactionOutgoingSpid.new # TransactionOutgoingSpid | Información de las transferencias SPID de salida


begin
  #Registro de transferencias SPID®
  result = api_instance.register_outgoing_spid_transaction_using_post(authorization, subscription, transactions)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling TransferenciasSPIDApi->register_outgoing_spid_transaction_using_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 
 **transactions** | [**TransactionOutgoingSpid**](TransactionOutgoingSpid.md)| Información de las transferencias SPID de salida | 

### Return type

[**TokenRequiredResponse**](TokenRequiredResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



