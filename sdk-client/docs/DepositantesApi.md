# Wire4Client::DepositantesApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_depositants_using_get**](DepositantesApi.md#get_depositants_using_get) | **GET** /subscriptions/{subscription}/depositants | Consulta de cuentas de depositantes
[**register_depositants_using_post**](DepositantesApi.md#register_depositants_using_post) | **POST** /subscriptions/{subscription}/depositants | Registra un nuevo depositante


# **get_depositants_using_get**
> GetDepositants get_depositants_using_get(authorization, subscription)

Consulta de cuentas de depositantes

Obtiene una lista de depositantes asociados al contrato relacionado a la suscripción.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::DepositantesApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.


begin
  #Consulta de cuentas de depositantes
  result = api_instance.get_depositants_using_get(authorization, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling DepositantesApi->get_depositants_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 

### Return type

[**GetDepositants**](GetDepositants.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **register_depositants_using_post**
> DepositantsResponse register_depositants_using_post(authorization, register, subscription)

Registra un nuevo depositante

Registra un nuevo depositante en el contrato asociado a la suscripción.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::DepositantesApi.new

authorization = 'authorization_example' # String | Header para token

register = Wire4Client::DepositantsRegister.new # DepositantsRegister | Depositant info

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.


begin
  #Registra un nuevo depositante
  result = api_instance.register_depositants_using_post(authorization, register, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling DepositantesApi->register_depositants_using_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **register** | [**DepositantsRegister**](DepositantsRegister.md)| Depositant info | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 

### Return type

[**DepositantsResponse**](DepositantsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



