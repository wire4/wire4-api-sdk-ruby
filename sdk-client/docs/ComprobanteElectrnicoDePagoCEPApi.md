# Wire4Client::ComprobanteElectrnicoDePagoCEPApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**obtain_transaction_cep_using_post**](ComprobanteElectrnicoDePagoCEPApi.md#obtain_transaction_cep_using_post) | **POST** /ceps | Consulta de CEP


# **obtain_transaction_cep_using_post**
> CepResponse obtain_transaction_cep_using_post(authorization, cep_data)

Consulta de CEP

Consulta el CEP de un pago realizado a través del SPEI, si es que este se encuentra disponible en BANXICO.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::ComprobanteElectrnicoDePagoCEPApi.new

authorization = 'authorization_example' # String | Header para token

cep_data = Wire4Client::CepSearchBanxico.new # CepSearchBanxico | Información para buscar un CEP


begin
  #Consulta de CEP
  result = api_instance.obtain_transaction_cep_using_post(authorization, cep_data)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling ComprobanteElectrnicoDePagoCEPApi->obtain_transaction_cep_using_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **cep_data** | [**CepSearchBanxico**](CepSearchBanxico.md)| Información para buscar un CEP | 

### Return type

[**CepResponse**](CepResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



