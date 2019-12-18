# Wire4Client::DepositantesApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_depositants_using_get**](DepositantesApi.md#get_depositants_using_get) | **GET** /subscriptions/{subscription}/depositants | Consulta de cuentas de depositantes
[**register_depositants_using_post**](DepositantesApi.md#register_depositants_using_post) | **POST** /subscriptions/{subscription}/depositants | Registra un nuevo depositante


# **get_depositants_using_get**
> GetDepositants get_depositants_using_get(subscription)

Consulta de cuentas de depositantes

Obtiene una lista de depositantes asociados al contrato relacionado a la subscripción.

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app_user_spei
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::DepositantesApi.new

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Consulta de cuentas de depositantes
  result = api_instance.get_depositants_using_get(subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling DepositantesApi->get_depositants_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

[**GetDepositants**](GetDepositants.md)

### Authorization

[wire4_aut_app_user_spei](../README.md#wire4_aut_app_user_spei)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **register_depositants_using_post**
> DepositantsResponse register_depositants_using_post(register, subscription)

Registra un nuevo depositante

Registra un nuevo depositante en el contrato asociado a la subscripción.

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app_user_spei
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::DepositantesApi.new

register = Wire4Client::DepositantsRegister.new # DepositantsRegister | Depositant info

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Registra un nuevo depositante
  result = api_instance.register_depositants_using_post(register, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling DepositantesApi->register_depositants_using_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **register** | [**DepositantsRegister**](DepositantsRegister.md)| Depositant info | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

[**DepositantsResponse**](DepositantsResponse.md)

### Authorization

[wire4_aut_app_user_spei](../README.md#wire4_aut_app_user_spei)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



