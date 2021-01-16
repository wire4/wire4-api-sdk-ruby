# Wire4Client::EmpresasCoDiApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**obtain_companies**](EmpresasCoDiApi.md#obtain_companies) | **GET** /codi/companies | Consulta de empresas CODI®
[**register_company_using_post**](EmpresasCoDiApi.md#register_company_using_post) | **POST** /codi/companies | Registro de empresas CODI®


# **obtain_companies**
> Array&lt;CompanyRegistered&gt; obtain_companies(authorization)

Consulta de empresas CODI®

Consulta de empresas CODI® registradas para la aplicación.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::EmpresasCoDiApi.new

authorization = 'authorization_example' # String | Header para token


begin
  #Consulta de empresas CODI®
  result = api_instance.obtain_companies(authorization)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling EmpresasCoDiApi->obtain_companies: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 

### Return type

[**Array&lt;CompanyRegistered&gt;**](CompanyRegistered.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **register_company_using_post**
> CompanyRegistered register_company_using_post(authorization, request_dto)

Registro de empresas CODI®

Registra una empresa para hacer uso de operaciones CODI®.<br><br> <b>Nota:<b> Es requerido tener el certificado emitido por BANXICO® asi como el Nombre de la empresa, Nombre comercial y el Registro Federal de Contribuyentes (RFC) de la empresa.<br/>

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::EmpresasCoDiApi.new

authorization = 'authorization_example' # String | Header para token

request_dto = Wire4Client::CompanyRequested.new # CompanyRequested | Información de la cuenta del beneficiario


begin
  #Registro de empresas CODI®
  result = api_instance.register_company_using_post(authorization, request_dto)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling EmpresasCoDiApi->register_company_using_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **request_dto** | [**CompanyRequested**](CompanyRequested.md)| Información de la cuenta del beneficiario | 

### Return type

[**CompanyRegistered**](CompanyRegistered.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



