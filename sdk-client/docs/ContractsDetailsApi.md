# Wire4Client::ContractsDetailsApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_authorization**](ContractsDetailsApi.md#create_authorization) | **POST** /onboarding/accounts/authorize | Devuelve la URL para autorización del usuario Monex
[**obtain_authorized_users**](ContractsDetailsApi.md#obtain_authorized_users) | **GET** /onboarding/accounts/{requestId}/authorized-users | Obtiene los usuarios autorizados
[**obtain_authorized_users_by_contract**](ContractsDetailsApi.md#obtain_authorized_users_by_contract) | **GET** /onboarding/accounts/authorized-users | Obtiene los usuarios autorizados por contrato
[**obtain_contract_details**](ContractsDetailsApi.md#obtain_contract_details) | **POST** /onboarding/accounts/details | Obtiene los detalles de la empresa del contrato


# **create_authorization**
> TokenRequiredResponse create_authorization(authorization, pre_monex_authorization)

Devuelve la URL para autorización del usuario Monex

Se obtiene la URL para la autorización del usuario Monex.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::ContractsDetailsApi.new

authorization = 'authorization_example' # String | Header para token

pre_monex_authorization = Wire4Client::PreMonexAuthorization.new # PreMonexAuthorization | Información para la autorización


begin
  #Devuelve la URL para autorización del usuario Monex
  result = api_instance.create_authorization(authorization, pre_monex_authorization)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling ContractsDetailsApi->create_authorization: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **pre_monex_authorization** | [**PreMonexAuthorization**](PreMonexAuthorization.md)| Información para la autorización | 

### Return type

[**TokenRequiredResponse**](TokenRequiredResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **obtain_authorized_users**
> Array&lt;AuthorizedUsers&gt; obtain_authorized_users(authorization, x_access_key, request_id)

Obtiene los usuarios autorizados

Obtienen los detalles de los usuarios autorizados de Monex.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::ContractsDetailsApi.new

authorization = 'authorization_example' # String | Header para token

x_access_key = 'x_access_key_example' # String | La llave de acceso de la aplicación

request_id = 'request_id_example' # String | El identificador de la petición a esta API


begin
  #Obtiene los usuarios autorizados
  result = api_instance.obtain_authorized_users(authorization, x_access_key, request_id)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling ContractsDetailsApi->obtain_authorized_users: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **x_access_key** | **String**| La llave de acceso de la aplicación | 
 **request_id** | **String**| El identificador de la petición a esta API | 

### Return type

[**Array&lt;AuthorizedUsers&gt;**](AuthorizedUsers.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **obtain_authorized_users_by_contract**
> Array&lt;AuthorizedUsers&gt; obtain_authorized_users_by_contract(authorization, x_access_key, opts)

Obtiene los usuarios autorizados por contrato

Obtienen los detalles de los usuarios autorizados por contrato Monex.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::ContractsDetailsApi.new

authorization = 'authorization_example' # String | Header para token

x_access_key = 'x_access_key_example' # String | La llave de acceso de la aplicación

opts = { 
  contract: 'contract_example' # String | El contrato Monex
}

begin
  #Obtiene los usuarios autorizados por contrato
  result = api_instance.obtain_authorized_users_by_contract(authorization, x_access_key, opts)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling ContractsDetailsApi->obtain_authorized_users_by_contract: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **x_access_key** | **String**| La llave de acceso de la aplicación | 
 **contract** | **String**| El contrato Monex | [optional] 

### Return type

[**Array&lt;AuthorizedUsers&gt;**](AuthorizedUsers.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **obtain_contract_details**
> ContractDetailResponse obtain_contract_details(authorization, x_access_key, contract_detail_request)

Obtiene los detalles de la empresa del contrato

Detalles de la compañía relacionada con el contrato de Monex.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::ContractsDetailsApi.new

authorization = 'authorization_example' # String | Header para token

x_access_key = 'x_access_key_example' # String | La llave de acceso de la aplicación

contract_detail_request = Wire4Client::ContractDetailRequest.new # ContractDetailRequest | Información para obtener los detalles de la companía


begin
  #Obtiene los detalles de la empresa del contrato
  result = api_instance.obtain_contract_details(authorization, x_access_key, contract_detail_request)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling ContractsDetailsApi->obtain_contract_details: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **x_access_key** | **String**| La llave de acceso de la aplicación | 
 **contract_detail_request** | [**ContractDetailRequest**](ContractDetailRequest.md)| Información para obtener los detalles de la companía | 

### Return type

[**ContractDetailResponse**](ContractDetailResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



