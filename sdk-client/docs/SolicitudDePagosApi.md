# Wire4Client::SolicitudDePagosApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**register_payment_request_using_post**](SolicitudDePagosApi.md#register_payment_request_using_post) | **POST** /payment-request | Registro de solicitud de pagos


# **register_payment_request_using_post**
> PaymentRequestResponse register_payment_request_using_post(authorization, payment_request_req_dto)

Registro de solicitud de pagos

 Se registra una solicitud de pagos. En la respuesta se proporcionará una dirección URL que lo llevará al sitio donde se le solicitará ingresar los datos de tarjeta a la que se aplicarán los cargos.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::SolicitudDePagosApi.new

authorization = 'authorization_example' # String | Header para token

payment_request_req_dto = Wire4Client::PaymentRequestReq.new # PaymentRequestReq | Información de la solicitud de pagos


begin
  #Registro de solicitud de pagos
  result = api_instance.register_payment_request_using_post(authorization, payment_request_req_dto)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling SolicitudDePagosApi->register_payment_request_using_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **payment_request_req_dto** | [**PaymentRequestReq**](PaymentRequestReq.md)| Información de la solicitud de pagos | 

### Return type

[**PaymentRequestResponse**](PaymentRequestResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



