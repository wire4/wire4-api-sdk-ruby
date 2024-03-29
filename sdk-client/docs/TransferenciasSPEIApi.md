# Wire4Client::TransferenciasSPEIApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_authorization_transactions_group**](TransferenciasSPEIApi.md#create_authorization_transactions_group) | **POST** /subscriptions/{subscription}/transactions/group | Agrupa transacciones bajo un request_id 
[**drop_transactions_pending_using_delete**](TransferenciasSPEIApi.md#drop_transactions_pending_using_delete) | **DELETE** /subscriptions/{subscription}/transactions/outcoming/spei/request/{requestId} | Eliminación de transferencias SPEI® pendientes
[**incoming_spei_transactions_report_using_get**](TransferenciasSPEIApi.md#incoming_spei_transactions_report_using_get) | **GET** /subscriptions/{subscription}/transactions/incoming/spei | Consulta de transferencias recibidas
[**out_comming_spei_request_id_transactions_report_using_get**](TransferenciasSPEIApi.md#out_comming_spei_request_id_transactions_report_using_get) | **GET** /subscriptions/{subscription}/transactions/outcoming/spei/{requestId} | Consulta de transferencias de salida por identificador de petición
[**out_comming_spei_spid_order_id_transaction_report_using_get**](TransferenciasSPEIApi.md#out_comming_spei_spid_order_id_transaction_report_using_get) | **GET** /subscriptions/{subscription}/transactions/outcoming | Consulta de transferencias realizadas por order_id
[**out_comming_spei_spid_request_id_transactions_report_using_get**](TransferenciasSPEIApi.md#out_comming_spei_spid_request_id_transactions_report_using_get) | **GET** /subscriptions/{subscription}/transactions/outcoming/{requestId} | Consulta de transferencias de salida por identificador de petición
[**outgoing_spei_transactions_report_using_get**](TransferenciasSPEIApi.md#outgoing_spei_transactions_report_using_get) | **GET** /subscriptions/{subscription}/transactions/outcoming/spei | Consulta de transferencias realizadas
[**register_outgoing_spei_transaction_using_post**](TransferenciasSPEIApi.md#register_outgoing_spei_transaction_using_post) | **POST** /subscriptions/{subscription}/transactions/outcoming/spei | Registro de transferencias
[**register_spei_spid_outgoing_transactions_using_post**](TransferenciasSPEIApi.md#register_spei_spid_outgoing_transactions_using_post) | **POST** /subscriptions/{subscription}/transactions/outcoming | Registro de transferencias SPEI y SPID


# **create_authorization_transactions_group**
> TokenRequiredResponse create_authorization_transactions_group(authorization, subscription, subscription2)

Agrupa transacciones bajo un request_id 

Agrupa transacciones SPEI/SPID en un mismo transaction_id, posteriormente genera la dirección URL del centro de autorización para la confirmación de las transacciones. <br><br>Las transacciones deben estar en estatus PENDING y pertenecer a un mismo contrato.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPEIApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | Es el Identificador de la suscripción.

subscription2 = Wire4Client::AuthorizationTransactionGroup.new # AuthorizationTransactionGroup | Objeto con la información para agrupar transacciones existentes y autorizarlas de forma conjunta.


begin
  #Agrupa transacciones bajo un request_id 
  result = api_instance.create_authorization_transactions_group(authorization, subscription, subscription2)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling TransferenciasSPEIApi->create_authorization_transactions_group: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| Es el Identificador de la suscripción. | 
 **subscription2** | [**AuthorizationTransactionGroup**](AuthorizationTransactionGroup.md)| Objeto con la información para agrupar transacciones existentes y autorizarlas de forma conjunta. | 

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

Elimina un conjunto de transferencias en estado pendiente de confirmar o autorizar, en la cuenta del cliente Monex relacionada a la suscripción.<br><br><b>Nota:</b> Las transferencias no deben haber sido confirmadas o autorizadas por el cliente.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPEIApi.new

authorization = 'authorization_example' # String | Header para token

request_id = 'request_id_example' # String | Identificador de las transferencias a eliminar.

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.

opts = { 
  order_id: 'order_id_example' # String | Listado de identificadores dentro del request_id para eliminar.
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
 **request_id** | **String**| Identificador de las transferencias a eliminar. | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 
 **order_id** | **String**| Listado de identificadores dentro del request_id para eliminar. | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **incoming_spei_transactions_report_using_get**
> Array&lt;Deposit&gt; incoming_spei_transactions_report_using_get(authorization, subscription, opts)

Consulta de transferencias recibidas

Realiza una consulta de las transferencias recibidas (depósitos) en la cuenta del cliente Monex relacionada a la suscripción, las transferencias que regresa este recuso son únicamente las transferencias  recibidas durante el día en el que se realiza la consulta. Para consultar transacciones que se encuentran en otras fechas se debe utilizar los parámetros de fecha inicial (beginDate) y fecha final (endDate), siempre deben de ir las dos ya que en caso de que falte una marcará error la consulta, si faltan las dos la consulta lanzará solo las del día, como se describe al inicio. El formato para las fechas es \"yyyy-MM-dd\"

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPEIApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.

opts = { 
  begin_date: 'begin_date_example', # String | Fecha inicial para filtrar los depósitos, se espera en formato 'yyyy-MM-dd'
  end_date: 'end_date_example' # String | Fecha final para filtrar los depósitos, se espera en formato 'yyyy-MM-dd'
}

begin
  #Consulta de transferencias recibidas
  result = api_instance.incoming_spei_transactions_report_using_get(authorization, subscription, opts)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling TransferenciasSPEIApi->incoming_spei_transactions_report_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 
 **begin_date** | **String**| Fecha inicial para filtrar los depósitos, se espera en formato &#39;yyyy-MM-dd&#39; | [optional] 
 **end_date** | **String**| Fecha final para filtrar los depósitos, se espera en formato &#39;yyyy-MM-dd&#39; | [optional] 

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

Consulta las transferencias de salida registradas en una petición, las transferencias que regresa este recuso son únicamente las transferencias de salida agrupadas al identificador de la petición que se generó al hacer el registro de las transacciones el cuál se debe especificar como parte del path de este endpoint.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPEIApi.new

authorization = 'authorization_example' # String | Header para token

request_id = 'request_id_example' # String | Identificador de la petición a buscar.

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.


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
 **request_id** | **String**| Identificador de la petición a buscar. | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 

### Return type

[**PaymentsRequestId**](PaymentsRequestId.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **out_comming_spei_spid_order_id_transaction_report_using_get**
> PaymentsSpeiAndSpidOrderId out_comming_spei_spid_order_id_transaction_report_using_get(authorization, subscription, opts)

Consulta de transferencias realizadas por order_id

Consulta las transferencias que regresa este recuso son únicamente las transferencias recibidas en el día en el que se realiza la consulta o las transferencias identificadas con el <strong>order_id</strong> proporcionado, para este tipo de consultas no importa el día en el que se realizó la transferencia. <br> Es importante que conozca que la respuesta puede dar como resultado un objeto con una lista spei o una lista spid con el/los elementos ya que un identificador order_id solo puede pertenecer a una transacción sea spei o spid.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPEIApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.

opts = { 
  order_id: 'order_id_example' # String | Es el identificador de la orden a buscar.
}

begin
  #Consulta de transferencias realizadas por order_id
  result = api_instance.out_comming_spei_spid_order_id_transaction_report_using_get(authorization, subscription, opts)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling TransferenciasSPEIApi->out_comming_spei_spid_order_id_transaction_report_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 
 **order_id** | **String**| Es el identificador de la orden a buscar. | [optional] 

### Return type

[**PaymentsSpeiAndSpidOrderId**](PaymentsSpeiAndSpidOrderId.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **out_comming_spei_spid_request_id_transactions_report_using_get**
> PaymentsSpeiAndSpidRequestId out_comming_spei_spid_request_id_transactions_report_using_get(authorization, request_id, subscription)

Consulta de transferencias de salida por identificador de petición

Consulta las transferencias de salida registradas en una petición, las transferencias que regresa este recuso son únicamente las transferencias de salida agrupadas al identificador de la petición que se generó al hacer el registro de las transacciones el cuál se debe especificar como parte del path de este endpoint.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPEIApi.new

authorization = 'authorization_example' # String | Header para token

request_id = 'request_id_example' # String | Identificador de la petición a buscar.

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.


begin
  #Consulta de transferencias de salida por identificador de petición
  result = api_instance.out_comming_spei_spid_request_id_transactions_report_using_get(authorization, request_id, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling TransferenciasSPEIApi->out_comming_spei_spid_request_id_transactions_report_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **request_id** | **String**| Identificador de la petición a buscar. | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 

### Return type

[**PaymentsSpeiAndSpidRequestId**](PaymentsSpeiAndSpidRequestId.md)

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

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.

opts = { 
  order_id: 'order_id_example' # String | Es el identificador de la orden a buscar.
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
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 
 **order_id** | **String**| Es el identificador de la orden a buscar. | [optional] 

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

Se registra un conjunto de transferencias (una o más) a realizar en la cuenta del cliente Monex relacionada a la suscripción. En la respuesta se proporcionará una dirección URL que lo llevará al centro de autorización para que las transferencias sean confirmadas (autorizadas) por el cliente para que se efectúen, para ello debe ingresar la llave electrónica (Token).<br>  Nota: Debe considerar que el concepto de cada una de las transacciones solo debe contener caracteres alfanuméricos por lo que en caso de que se reciban caracteres como ñ o acentos serán sustituidos por n o en su caso por la letra sin acento. Los caracteres no alfanuméricos como pueden ser caracteres especiales serán eliminados.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPEIApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.

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
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 
 **transactions** | [**TransactionsOutgoingRegister**](TransactionsOutgoingRegister.md)| Información de las transferencias SPEI de salida | 

### Return type

[**TokenRequiredResponse**](TokenRequiredResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **register_spei_spid_outgoing_transactions_using_post**
> TokenRequiredResponse register_spei_spid_outgoing_transactions_using_post(authorization, subscription, transactions)

Registro de transferencias SPEI y SPID

Se registra un conjunto de transferencias (una o más) tanto SPEI como SPID en una sola petición en la cuenta del cliente Monex relacionada a la suscripción. En la respuesta se proporcionará una dirección URL que lo llevará al centro de autorización para que las transferencias sean confirmadas (autorizadas) por el cliente para que se efectúen, para ello debe ingresar la llave electrónica (Token).<br>  Nota: Debe considerar que el concepto de cada una de las transacciones solo debe contener caracteres alfanuméricos por lo que en caso de que se reciban caracteres como ñ o acentos serán sustituidos por n o en su caso por la letra sin acento. Los caracteres no alfanuméricos como pueden ser caracteres especiales serán eliminados.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::TransferenciasSPEIApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.

transactions = Wire4Client::TransactionsRegister.new # TransactionsRegister | Información de las transferencias SPEI y SPID de salida


begin
  #Registro de transferencias SPEI y SPID
  result = api_instance.register_spei_spid_outgoing_transactions_using_post(authorization, subscription, transactions)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling TransferenciasSPEIApi->register_spei_spid_outgoing_transactions_using_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 
 **transactions** | [**TransactionsRegister**](TransactionsRegister.md)| Información de las transferencias SPEI y SPID de salida | 

### Return type

[**TokenRequiredResponse**](TokenRequiredResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



