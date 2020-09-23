# Wire4Client::OperacionesCoDiApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**consult_codi_operations**](OperacionesCoDiApi.md#consult_codi_operations) | **POST** /codi/charges | Obtiene las operaciones generadas a partir de peticiones de pago CoDi® de forma paginada, pudiendo aplicar filtros


# **consult_codi_operations**
> PagerResponseDto consult_codi_operations(authorization, opts)

Obtiene las operaciones generadas a partir de peticiones de pago CoDi® de forma paginada, pudiendo aplicar filtros

Obtiene las operaciones generadas a partir de peticiones de pago CoDi® de forma paginada, pudiendo aplicar filtros

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::OperacionesCoDiApi.new

authorization = 'authorization_example' # String | Header para token

opts = { 
  company_id: 'company_id_example', # String | Identificador de empresa CoDi
  page: '0', # String | Número de pago
  request_filters: Wire4Client::CodiOperationsFiltersRequestDTO.new, # CodiOperationsFiltersRequestDTO | Filtros de busqueda
  sales_point_id: 'sales_point_id_example', # String | Identificador del punto de venta
  size: '20' # String | Tamaño de pagina
}

begin
  #Obtiene las operaciones generadas a partir de peticiones de pago CoDi® de forma paginada, pudiendo aplicar filtros
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
 **company_id** | **String**| Identificador de empresa CoDi | [optional] 
 **page** | **String**| Número de pago | [optional] [default to 0]
 **request_filters** | [**CodiOperationsFiltersRequestDTO**](CodiOperationsFiltersRequestDTO.md)| Filtros de busqueda | [optional] 
 **sales_point_id** | **String**| Identificador del punto de venta | [optional] 
 **size** | **String**| Tamaño de pagina | [optional] [default to 20]

### Return type

[**PagerResponseDto**](PagerResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



