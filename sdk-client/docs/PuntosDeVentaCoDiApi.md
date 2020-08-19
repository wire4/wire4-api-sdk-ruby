# Wire4Client::PuntosDeVentaCoDiApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_sales_point**](PuntosDeVentaCoDiApi.md#create_sales_point) | **POST** /codi/companies/salespoint | Registra un punto de venta asociado a una empresa
[**obtain_sale_points**](PuntosDeVentaCoDiApi.md#obtain_sale_points) | **GET** /codi/companies/salespoint | Obtiene los puntos de venta asociados a una empresa


# **create_sales_point**
> SalesPointRespose create_sales_point(authorization, company_id, sales_point_info)

Registra un punto de venta asociado a una empresa

Registra un punto de venta desde donde se emitaran los cobros CODI®, el punto de venta se debe asociar a un cuenta cableregistrada previamente ante Banxico para realizar cobros con CODI®

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::PuntosDeVentaCoDiApi.new

authorization = 'authorization_example' # String | Header para token

company_id = 'company_id_example' # String | El identificador de la empresa

sales_point_info = Wire4Client::SalesPointRequest.new # SalesPointRequest | Información del punto de venta CODI®


begin
  #Registra un punto de venta asociado a una empresa
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
 **company_id** | **String**| El identificador de la empresa | 
 **sales_point_info** | [**SalesPointRequest**](SalesPointRequest.md)| Información del punto de venta CODI® | 

### Return type

[**SalesPointRespose**](SalesPointRespose.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **obtain_sale_points**
> Array&lt;SalesPointFound&gt; obtain_sale_points(authorization, company_id)

Obtiene los puntos de venta asociados a una empresa

Obtiene los puntos de venta asociados a una empresa en las cuales se hacen operaciones CODI®

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::PuntosDeVentaCoDiApi.new

authorization = 'authorization_example' # String | Header para token

company_id = 'company_id_example' # String | El identificador de la empresa


begin
  #Obtiene los puntos de venta asociados a una empresa
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
 **company_id** | **String**| El identificador de la empresa | 

### Return type

[**Array&lt;SalesPointFound&gt;**](SalesPointFound.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



