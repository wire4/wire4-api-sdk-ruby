# Wire4Client::PeticionesDePagoPorCoDiApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**consult_codi_request_by_order_id**](PeticionesDePagoPorCoDiApi.md#consult_codi_request_by_order_id) | **GET** /codi/sales-point/{sales_point_id}/charges/{order_id} | Obtiene la información de una petición de pago CODI® por orderId para un punto de venta
[**generate_codi_code_qr**](PeticionesDePagoPorCoDiApi.md#generate_codi_code_qr) | **POST** /codi/sales-point/{salesPointId}/charges | Genera un código QR para un pago mediante CODI®


# **consult_codi_request_by_order_id**
> PaymentRequestCodiResponseDTO consult_codi_request_by_order_id(authorization, order_id, sales_point_id)

Obtiene la información de una petición de pago CODI® por orderId para un punto de venta

Obtiene la información de una petición de pago CODI® por orderId para un punto de venta

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::PeticionesDePagoPorCoDiApi.new

authorization = 'authorization_example' # String | Header para token

order_id = 'order_id_example' # String | OrderId

sales_point_id = 'sales_point_id_example' # String | Identificador del punto de venta


begin
  #Obtiene la información de una petición de pago CODI® por orderId para un punto de venta
  result = api_instance.consult_codi_request_by_order_id(authorization, order_id, sales_point_id)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling PeticionesDePagoPorCoDiApi->consult_codi_request_by_order_id: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **order_id** | **String**| OrderId | 
 **sales_point_id** | **String**| Identificador del punto de venta | 

### Return type

[**PaymentRequestCodiResponseDTO**](PaymentRequestCodiResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **generate_codi_code_qr**
> CodiCodeQrResponseDTO generate_codi_code_qr(authorization, codi_info, sales_point_id)

Genera un código QR para un pago mediante CODI®

Genera un código QR solicitado por un punto de venta para un pago mediante CODI®

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::PeticionesDePagoPorCoDiApi.new

authorization = 'authorization_example' # String | Header para token

codi_info = Wire4Client::CodiCodeRequestDTO.new # CodiCodeRequestDTO | Información del pago CODI®

sales_point_id = 'sales_point_id_example' # String | Identificador del punto de venta


begin
  #Genera un código QR para un pago mediante CODI®
  result = api_instance.generate_codi_code_qr(authorization, codi_info, sales_point_id)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling PeticionesDePagoPorCoDiApi->generate_codi_code_qr: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **codi_info** | [**CodiCodeRequestDTO**](CodiCodeRequestDTO.md)| Información del pago CODI® | 
 **sales_point_id** | **String**| Identificador del punto de venta | 

### Return type

[**CodiCodeQrResponseDTO**](CodiCodeQrResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



