# Wire4Client::LmitesDeMontosApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**obtain_configurations_limits**](LmitesDeMontosApi.md#obtain_configurations_limits) | **GET** /subscriptions/{suscription}/configurations | Consulta de configuraciones
[**update_configurations**](LmitesDeMontosApi.md#update_configurations) | **PUT** /subscriptions/{suscription}/configurations | Actualiza configuraciones por suscripción


# **obtain_configurations_limits**
> MessageConfigurationsLimits obtain_configurations_limits(authorization, suscription)

Consulta de configuraciones

Consulta las configuraciones para el contrato asocaido al enrolamiento en la aplicación.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::LmitesDeMontosApi.new

authorization = 'authorization_example' # String | Header para token

suscription = 'suscription_example' # String | Es el identificador de la suscripción a esta API.


begin
  #Consulta de configuraciones
  result = api_instance.obtain_configurations_limits(authorization, suscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling LmitesDeMontosApi->obtain_configurations_limits: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **suscription** | **String**| Es el identificador de la suscripción a esta API. | 

### Return type

[**MessageConfigurationsLimits**](MessageConfigurationsLimits.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **update_configurations**
> update_configurations(authorization, suscription, update_configurations_resquest_dto)

Actualiza configuraciones por suscripción

Actualiza las configuraciones de un contrato asociado a una suscripción

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::LmitesDeMontosApi.new

authorization = 'authorization_example' # String | Header para token

suscription = 'suscription_example' # String | suscription

update_configurations_resquest_dto = Wire4Client::UpdateConfigurationsRequestDTO.new # UpdateConfigurationsRequestDTO | updateConfigurationsResquestDTO


begin
  #Actualiza configuraciones por suscripción
  api_instance.update_configurations(authorization, suscription, update_configurations_resquest_dto)
rescue Wire4Client::ApiError => e
  puts "Exception when calling LmitesDeMontosApi->update_configurations: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **suscription** | **String**| suscription | 
 **update_configurations_resquest_dto** | [**UpdateConfigurationsRequestDTO**](UpdateConfigurationsRequestDTO.md)| updateConfigurationsResquestDTO | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*



