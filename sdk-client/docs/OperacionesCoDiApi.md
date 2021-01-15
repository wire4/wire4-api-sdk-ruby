# Wire4Client::OperacionesCoDiApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**consult_codi_operations**](OperacionesCoDiApi.md#consult_codi_operations) | **POST** /codi/charges | Consulta de operaciones


# **consult_codi_operations**
> PagerResponseDto consult_codi_operations(authorization, opts)

Consulta de operaciones

Obtiene las operaciones generadas a partir de peticiones de pago CODI® de forma paginada, pudiendo aplicar filtros.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::OperacionesCoDiApi.new

authorization = 'authorization_example' # String | Header para token

opts = { 
  company_id: 'company_id_example', # String | Es el identificador de empresa CODI®.
  page: '0', # String | Es el número de pago.
  request_filters: Wire4Client::CodiOperationsFiltersRequestDTO.new, # CodiOperationsFiltersRequestDTO | Filtros de busqueda
  sales_point_id: 'sales_point_id_example', # String | Es el identificador del punto de venta.
  size: '20' # String | Es el tamaño de página.
}

begin
  #Consulta de operaciones
  result = api_instance.consult_codi_operations(authorization, opts)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling OperacionesCoDiApi->consult_codi_operations: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **company_id** | **String**| Es el identificador de empresa CODI®. | [optional] 
 **page** | **String**| Es el número de pago. | [optional] [default to 0]
 **request_filters** | [**CodiOperationsFiltersRequestDTO**](CodiOperationsFiltersRequestDTO.md)| Filtros de busqueda | [optional] 
 **sales_point_id** | **String**| Es el identificador del punto de venta. | [optional] 
 **size** | **String**| Es el tamaño de página. | [optional] [default to 20]

### Return type

[**PagerResponseDto**](PagerResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



