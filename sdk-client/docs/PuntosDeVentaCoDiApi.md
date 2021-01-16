# Wire4Client::PuntosDeVentaCoDiApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_sales_point**](PuntosDeVentaCoDiApi.md#create_sales_point) | **POST** /codi/companies/salespoint | Registro de punto de venta.
[**obtain_sale_points**](PuntosDeVentaCoDiApi.md#obtain_sale_points) | **GET** /codi/companies/salespoint | Consulta de puntos de venta


# **create_sales_point**
> SalesPointRespose create_sales_point(authorization, company_id, sales_point_info)

Registro de punto de venta.

Se registra un punto de venta (TPV) desde donde se emitarán los cobros CODI®. El punto de venta se debe asociar a un cuenta CLABE registrada previamente ante Banxico para realizar cobros con CODI®.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::PuntosDeVentaCoDiApi.new

authorization = 'authorization_example' # String | Header para token

company_id = 'company_id_example' # String | Es el identificador de la empresa.

sales_point_info = Wire4Client::SalesPointRequest.new # SalesPointRequest | Es el objeto que contiene información del punto de venta CODI®.


begin
  #Registro de punto de venta.
  result = api_instance.create_sales_point(authorization, company_id, sales_point_info)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling PuntosDeVentaCoDiApi->create_sales_point: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **company_id** | **String**| Es el identificador de la empresa. | 
 **sales_point_info** | [**SalesPointRequest**](SalesPointRequest.md)| Es el objeto que contiene información del punto de venta CODI®. | 

### Return type

[**SalesPointRespose**](SalesPointRespose.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **obtain_sale_points**
> Array&lt;SalesPointFound&gt; obtain_sale_points(authorization, company_id)

Consulta de puntos de venta

Obtiene los puntos de venta asociados a una empresa en las cuales se hacen operaciones CODI®.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::PuntosDeVentaCoDiApi.new

authorization = 'authorization_example' # String | Header para token

company_id = 'company_id_example' # String | Es el identificador de la empresa. Ejemplo: 8838d513-5916-4662-bb30-2448f0f543ed


begin
  #Consulta de puntos de venta
  result = api_instance.obtain_sale_points(authorization, company_id)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling PuntosDeVentaCoDiApi->obtain_sale_points: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **company_id** | **String**| Es el identificador de la empresa. Ejemplo: 8838d513-5916-4662-bb30-2448f0f543ed | 

### Return type

[**Array&lt;SalesPointFound&gt;**](SalesPointFound.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



