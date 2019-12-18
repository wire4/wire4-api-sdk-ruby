# Wire4Client::FacturasApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**billings_report_by_id_using_get**](FacturasApi.md#billings_report_by_id_using_get) | **GET** /billings/{id} | Consulta de facturas por identificador
[**billings_report_using_get**](FacturasApi.md#billings_report_using_get) | **GET** /billings | Consulta de facturas


# **billings_report_by_id_using_get**
> Billing billings_report_by_id_using_get(id)

Consulta de facturas por identificador

Consulta las facturas emitidas por conceptos de uso de la plataforma y operaciones realizadas tanto de entrada como de salida. Se debe especificar el identificador de la factura

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::FacturasApi.new

id = 'id_example' # String | Identificador de la factura


begin
  #Consulta de facturas por identificador
  result = api_instance.billings_report_by_id_using_get(id)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling FacturasApi->billings_report_by_id_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Identificador de la factura | 

### Return type

[**Billing**](Billing.md)

### Authorization

[wire4_aut_app](../README.md#wire4_aut_app)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **billings_report_using_get**
> Array&lt;Billing&gt; billings_report_using_get(opts)

Consulta de facturas

Consulta las facturas emitidas por conceptos de uso de la plataforma y operaciones realizadas tanto de entrada como de salida. Es posible filtrar por periodo de fecha yyyy-MM, por ejemplo 2019-11

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::FacturasApi.new

opts = { 
  period: 'period_example' # String | Filtro de fecha yyyy-MM
}

begin
  #Consulta de facturas
  result = api_instance.billings_report_using_get(opts)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling FacturasApi->billings_report_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **period** | **String**| Filtro de fecha yyyy-MM | [optional] 

### Return type

[**Array&lt;Billing&gt;**](Billing.md)

### Authorization

[wire4_aut_app](../README.md#wire4_aut_app)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



