# Wire4Client::TransferenciasSPEIApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_authorization_transactions_group**](TransferenciasSPEIApi.md#create_authorization_transactions_group) | **POST** /subscriptions/{subscription}/transactions/group | Agrupa un conjunto de transacciones bajo un mismo request_id para autorizar
[**drop_transactions_pending_using_delete**](TransferenciasSPEIApi.md#drop_transactions_pending_using_delete) | **DELETE** /subscriptions/{subscription}/transactions/outcoming/spei/request/{requestId} | Eliminación de transferencias SPEI® pendientes
[**incoming_spei_transactions_report_using_get**](TransferenciasSPEIApi.md#incoming_spei_transactions_report_using_get) | **GET** /subscriptions/{subscription}/transactions/incoming/spei | Consulta de transferencias recibidas
[**out_comming_spei_request_id_transactions_report_using_get**](TransferenciasSPEIApi.md#out_comming_spei_request_id_transactions_report_using_get) | **GET** /subscriptions/{subscription}/transactions/outcoming/spei/{requestId} | Consulta de transferencias de salida por identificador de petición
[**outgoing_spei_transactions_report_using_get**](TransferenciasSPEIApi.md#outgoing_spei_transactions_report_using_get) | **GET** /subscriptions/{subscription}/transactions/outcoming/spei | Consulta de transferencias realizadas
[**register_outgoing_spei_transaction_using_post**](TransferenciasSPEIApi.md#register_outgoing_spei_transaction_using_post) | **POST** /subscriptions/{subscription}/transactions/outcoming/spei | Registro de transferencias


# **create_authorization_transactions_group**
> TokenRequiredResponse create_authorization_transactions_group(authorization, authorization_transactions_group_request_dto, subscription)

Agrupa un conjunto de transacciones bajo un mismo request_id para autorizar

Agrupa transacciones SPEI/SPID en un transaction_id, generando la URL para su autorización. Las transacciones deben estar en estatus PENDING y pertenecer a un mmismo contrato

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPEIApi.new

authorization = 'authorization_example' # String | Header para token

authorization_transactions_group_request_dto = Wire4Client::AuthorizationTransactionGroup.new # AuthorizationTransactionGroup | authorizationTransactionsGroupRequestDTO

subscription = 'subscription_example' # String | Identificador de la suscripcion


begin
  #Agrupa un conjunto de transacciones bajo un mismo request_id para autorizar
  result = api_instance.create_authorization_transactions_group(authorization, authorization_transactions_group_request_dto, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling TransferenciasSPEIApi->create_authorization_transactions_group: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **authorization_transactions_group_request_dto** | [**AuthorizationTransactionGroup**](AuthorizationTransactionGroup.md)| authorizationTransactionsGroupRequestDTO | 
 **subscription** | **String**| Identificador de la suscripcion | 

### Return type

[**TokenRequiredResponse**](TokenRequiredResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*



# **drop_transactions_pending_using_delete**
> drop_transactions_pending_using_delete(authorization, request_id, subscription, opts)

Eliminación de transferencias SPEI® pendientes

Elimina un conjunto de transferencias a realizar en la cuenta del cliente Monex relacionada a la suscripción, las transferencias no deben haber sido confirmadas por el cliente.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPEIApi.new

authorization = 'authorization_example' # String | Header para token

request_id = 'request_id_example' # String | Identificador de las transferencias a eliminar

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API

opts = { 
  order_id: 'order_id_example' # String | Listado de identificadores dentro del request_id para eliminar
}

begin
  #Eliminación de transferencias SPEI® pendientes
  api_instance.drop_transactions_pending_using_delete(authorization, request_id, subscription, opts)
rescue Wire4Client::ApiError => e
  puts "Exception when calling TransferenciasSPEIApi->drop_transactions_pending_using_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **request_id** | **String**| Identificador de las transferencias a eliminar | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 
 **order_id** | **String**| Listado de identificadores dentro del request_id para eliminar | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **incoming_spei_transactions_report_using_get**
> Array&lt;Deposit&gt; incoming_spei_transactions_report_using_get(authorization, subscription)

Consulta de transferencias recibidas

Realiza una consulta de las transferencias recibidas (depósitos) en la cuenta del cliente Monex relacionada a la suscripción, las transferencias que regresa este recuso son únicamente las transferencias  recibidas durante el día en el que se realiza la consulta.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPEIApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Consulta de transferencias recibidas
  result = api_instance.incoming_spei_transactions_report_using_get(authorization, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling TransferenciasSPEIApi->incoming_spei_transactions_report_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

[**Array&lt;Deposit&gt;**](Deposit.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **out_comming_spei_request_id_transactions_report_using_get**
> PaymentsRequestId out_comming_spei_request_id_transactions_report_using_get(authorization, request_id, subscription)

Consulta de transferencias de salida por identificador de petición

Consulta las transferencias de salida registradas en una petición, las transferencias que regresa este recuso son únicamente las transferencias de salida agrupadas al identificador de la petición que se generó al hacer el registro de las transacciones el cual se debe especificar como parte del path de este endpoint.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPEIApi.new

authorization = 'authorization_example' # String | Header para token

request_id = 'request_id_example' # String | Identificador de la petición a buscar

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Consulta de transferencias de salida por identificador de petición
  result = api_instance.out_comming_spei_request_id_transactions_report_using_get(authorization, request_id, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling TransferenciasSPEIApi->out_comming_spei_request_id_transactions_report_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **request_id** | **String**| Identificador de la petición a buscar | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

[**PaymentsRequestId**](PaymentsRequestId.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **outgoing_spei_transactions_report_using_get**
> Array&lt;Payment&gt; outgoing_spei_transactions_report_using_get(authorization, subscription, opts)

Consulta de transferencias realizadas

Consulta las transferencias realizadas en la cuenta del cliente Monex relacionada a la suscripción, las transferencias que regresa este recuso son únicamente las transferencias recibidas en el día en el que se realiza la consulta.<br>Se pueden realizar consultas por <strong>order_id</strong> al realizar este tipo de consultas no importa el día en el que se realizó la transferencia

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPEIApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API

opts = { 
  order_id: 'order_id_example' # String | Identificador de la orden a buscar
}

begin
  #Consulta de transferencias realizadas
  result = api_instance.outgoing_spei_transactions_report_using_get(authorization, subscription, opts)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling TransferenciasSPEIApi->outgoing_spei_transactions_report_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 
 **order_id** | **String**| Identificador de la orden a buscar | [optional] 

### Return type

[**Array&lt;Payment&gt;**](Payment.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **register_outgoing_spei_transaction_using_post**
> TokenRequiredResponse register_outgoing_spei_transaction_using_post(authorization, subscription, transactions)

Registro de transferencias

Registra un conjunto de transferencias a realizar en la cuenta del cliente Monex relacionada a la suscripción, las transferencias deben ser confirmadas por el cliente para que se efectuen.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPEIApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API

transactions = Wire4Client::TransactionsOutgoingRegister.new # TransactionsOutgoingRegister | Información de las transferencias SPEI de salida


begin
  #Registro de transferencias
  result = api_instance.register_outgoing_spei_transaction_using_post(authorization, subscription, transactions)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling TransferenciasSPEIApi->register_outgoing_spei_transaction_using_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 
 **transactions** | [**TransactionsOutgoingRegister**](TransactionsOutgoingRegister.md)| Información de las transferencias SPEI de salida | 

### Return type

[**TokenRequiredResponse**](TokenRequiredResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



