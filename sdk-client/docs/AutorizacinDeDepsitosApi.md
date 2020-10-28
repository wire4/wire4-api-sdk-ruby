# Wire4Client::AutorizacinDeDepsitosApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_deposit_auth_configurations**](AutorizacinDeDepsitosApi.md#get_deposit_auth_configurations) | **GET** /subscriptions/{subscription}/configurations/deposit-authorization | Consulta autorización de depósitos
[**put_deposit_auth_configurations**](AutorizacinDeDepsitosApi.md#put_deposit_auth_configurations) | **PUT** /subscriptions/{subscription}/configurations/deposit-authorization | Des/Habilitar autorización de depósitos


# **get_deposit_auth_configurations**
> DepositsAuthorizationResponse get_deposit_auth_configurations(authorization, subscription)

Consulta autorización de depósitos

Obtiene la información de la autorización de depósitos del contrato relacionado a la subscripción.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::AutorizacinDeDepsitosApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Consulta autorización de depósitos
  result = api_instance.get_deposit_auth_configurations(authorization, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling AutorizacinDeDepsitosApi->get_deposit_auth_configurations: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

[**DepositsAuthorizationResponse**](DepositsAuthorizationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **put_deposit_auth_configurations**
> DepositsAuthorizationResponse put_deposit_auth_configurations(authorization, register, subscription)

Des/Habilitar autorización de depósitos

Des/Habilitar autorización de depósitos, devuelve la información final de la autorización de depósitos del contrato relacionado a la subscripción al terminar.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::AutorizacinDeDepsitosApi.new

authorization = 'authorization_example' # String | Header para token

register = Wire4Client::DepositAuthorizationRequest.new # DepositAuthorizationRequest | Deposit Authorization info

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Des/Habilitar autorización de depósitos
  result = api_instance.put_deposit_auth_configurations(authorization, register, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling AutorizacinDeDepsitosApi->put_deposit_auth_configurations: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **register** | [**DepositAuthorizationRequest**](DepositAuthorizationRequest.md)| Deposit Authorization info | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

[**DepositsAuthorizationResponse**](DepositsAuthorizationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



