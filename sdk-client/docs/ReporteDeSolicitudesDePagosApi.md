# Wire4Client::ReporteDeSolicitudesDePagosApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**payment_request_id_report_by_order_id_using_get**](ReporteDeSolicitudesDePagosApi.md#payment_request_id_report_by_order_id_using_get) | **GET** /payment-request | Consulta de solicitudes de pago por numero de orden.
[**payment_request_id_report_using_get**](ReporteDeSolicitudesDePagosApi.md#payment_request_id_report_using_get) | **GET** /payment-request/{requestId} | Consulta de solicitudes de pago por identificador de petición


# **payment_request_id_report_by_order_id_using_get**
> PaymentRequestReportDTO payment_request_id_report_by_order_id_using_get(authorization, opts)

Consulta de solicitudes de pago por numero de orden.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::ReporteDeSolicitudesDePagosApi.new

authorization = 'authorization_example' # String | Header para token

opts = { 
  order_id: 'order_id_example' # String | Es el identificador de la orden a buscar.
}

begin
  #Consulta de solicitudes de pago por numero de orden.
  result = api_instance.payment_request_id_report_by_order_id_using_get(authorization, opts)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling ReporteDeSolicitudesDePagosApi->payment_request_id_report_by_order_id_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **order_id** | **String**| Es el identificador de la orden a buscar. | [optional] 

### Return type

[**PaymentRequestReportDTO**](PaymentRequestReportDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **payment_request_id_report_using_get**
> PaymentRequestReportDTO payment_request_id_report_using_get(authorization, request_id)

Consulta de solicitudes de pago por identificador de petición

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::ReporteDeSolicitudesDePagosApi.new

authorization = 'authorization_example' # String | Header para token

request_id = 'request_id_example' # String | Identificador de la petición a buscar.


begin
  #Consulta de solicitudes de pago por identificador de petición
  result = api_instance.payment_request_id_report_using_get(authorization, request_id)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling ReporteDeSolicitudesDePagosApi->payment_request_id_report_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **request_id** | **String**| Identificador de la petición a buscar. | 

### Return type

[**PaymentRequestReportDTO**](PaymentRequestReportDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



