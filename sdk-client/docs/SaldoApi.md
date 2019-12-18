# Wire4Client::SaldoApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_balance_using_get**](SaldoApi.md#get_balance_using_get) | **GET** /subscriptions/{subscription}/balance | Consulta los saldo de una cuenta


# **get_balance_using_get**
> BalanceListResponse get_balance_using_get(subscription)

Consulta los saldo de una cuenta

Obtiene el de las divisas que se manejen en el contrato.

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app_user_spei
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::SaldoApi.new

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Consulta los saldo de una cuenta
  result = api_instance.get_balance_using_get(subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling SaldoApi->get_balance_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

[**BalanceListResponse**](BalanceListResponse.md)

### Authorization

[wire4_aut_app_user_spei](../README.md#wire4_aut_app_user_spei)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



