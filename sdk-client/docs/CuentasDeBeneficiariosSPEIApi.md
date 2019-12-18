# Wire4Client::CuentasDeBeneficiariosSPEIApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_account_using_delete**](CuentasDeBeneficiariosSPEIApi.md#delete_account_using_delete) | **DELETE** /subscriptions/{subscription}/beneficiaries/spei/{account} | Elimina la cuenta del beneficiario
[**get_available_relationships_monex_using_get**](CuentasDeBeneficiariosSPEIApi.md#get_available_relationships_monex_using_get) | **GET** /subscriptions/{subscription}/beneficiaries/relationships | Consulta de relaciones
[**get_beneficiaries_for_account_using_get**](CuentasDeBeneficiariosSPEIApi.md#get_beneficiaries_for_account_using_get) | **GET** /subscriptions/{subscription}/beneficiaries/spei | Consulta los beneficiarios registrados
[**pre_register_accounts_using_post**](CuentasDeBeneficiariosSPEIApi.md#pre_register_accounts_using_post) | **POST** /subscriptions/{subscription}/beneficiaries/spei | Pre-registro de cuentas de beneficiarios.
[**remove_beneficiaries_pending_using_delete**](CuentasDeBeneficiariosSPEIApi.md#remove_beneficiaries_pending_using_delete) | **DELETE** /subscriptions/{subscription}/beneficiaries/spei/request/{requestId} | Eliminación de beneficiarios SPEI® sin confirmar
[**update_amount_limit_account_using_put**](CuentasDeBeneficiariosSPEIApi.md#update_amount_limit_account_using_put) | **PUT** /subscriptions/{subscription}/beneficiaries/spei/{account} | Actualiza el monto límite


# **delete_account_using_delete**
> delete_account_using_delete(account, subscription)

Elimina la cuenta del beneficiario

Borra la cuenta de beneficiario proporcionada relacionada al contrato perteneciente a la subscripción. La cuenta a borrar debe ser una cuenta que opere con SPEI.

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app_user_spei
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

account = 'account_example' # String | La cuenta del beneciario que será eliminada

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Elimina la cuenta del beneficiario
  api_instance.delete_account_using_delete(account, subscription)
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPEIApi->delete_account_using_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account** | **String**| La cuenta del beneciario que será eliminada | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

nil (empty response body)

### Authorization

[wire4_aut_app_user_spei](../README.md#wire4_aut_app_user_spei)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_available_relationships_monex_using_get**
> RelationshipsResponse get_available_relationships_monex_using_get(subscription)

Consulta de relaciones

Obtiene las posibles relaciones existentes para registrar beneficiarios en Monex. Se debe invocar este recurso antes de pre-registrar una cuenta de beneficiario.

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app_user_spei
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

subscription = 'subscription_example' # String | Identificador de la suscripción a esta API


begin
  #Consulta de relaciones
  result = api_instance.get_available_relationships_monex_using_get(subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPEIApi->get_available_relationships_monex_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription** | **String**| Identificador de la suscripción a esta API | 

### Return type

[**RelationshipsResponse**](RelationshipsResponse.md)

### Authorization

[wire4_aut_app_user_spei](../README.md#wire4_aut_app_user_spei)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_beneficiaries_for_account_using_get**
> BeneficiariesResponse get_beneficiaries_for_account_using_get(subscription, opts)

Consulta los beneficiarios registrados

Obtiene los beneficiarios registrados al contrato relacionado con la suscripción, Los beneficiarios son los que actualmente se encuentran registrados en banca Monex.

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app_user_spei
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API

opts = { 
  rfc: 'rfc_example' # String | RFC del beneficiario
}

begin
  #Consulta los beneficiarios registrados
  result = api_instance.get_beneficiaries_for_account_using_get(subscription, opts)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPEIApi->get_beneficiaries_for_account_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription** | **String**| El identificador de la suscripción a esta API | 
 **rfc** | **String**| RFC del beneficiario | [optional] 

### Return type

[**BeneficiariesResponse**](BeneficiariesResponse.md)

### Authorization

[wire4_aut_app_user_spei](../README.md#wire4_aut_app_user_spei)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **pre_register_accounts_using_post**
> TokenRequiredResponse pre_register_accounts_using_post(request_dto, subscription)

Pre-registro de cuentas de beneficiarios.

Pre-registra una o más cuentas de beneficiario en la plataforma, proporcionando una URL donde el cuentahabiente Monex debe ingresar un valor de su llave digital para confirmar el alta de las cuentas de beneficiarios.<br/>Los posibles valores de <i>relationship</i> y <i>kind_of_relationship</i> se deben  obtener de /subscriptions/{subscription}/beneficiaries/relationships.<br/><br/>La confirmación de registro en Monex se realiza a través de una llamada a los webhooks registrados con el evento ACCOUNT.CREATED.

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app_user_spei
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

request_dto = Wire4Client::AccountRequest.new # AccountRequest | Información de la cuenta del beneficiario

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Pre-registro de cuentas de beneficiarios.
  result = api_instance.pre_register_accounts_using_post(request_dto, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPEIApi->pre_register_accounts_using_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request_dto** | [**AccountRequest**](AccountRequest.md)| Información de la cuenta del beneficiario | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

[**TokenRequiredResponse**](TokenRequiredResponse.md)

### Authorization

[wire4_aut_app_user_spei](../README.md#wire4_aut_app_user_spei)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **remove_beneficiaries_pending_using_delete**
> remove_beneficiaries_pending_using_delete(request_id, subscription)

Eliminación de beneficiarios SPEI® sin confirmar

Elimina un conjunto de beneficiarios a registrar en la cuenta del cliente Monex relacionada a la suscripción, los beneficiarios no deben haber sido confirmados por el cliente.

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app_user_spei
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

request_id = 'request_id_example' # String | Identificador de los beneficiarios a eliminar

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Eliminación de beneficiarios SPEI® sin confirmar
  api_instance.remove_beneficiaries_pending_using_delete(request_id, subscription)
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPEIApi->remove_beneficiaries_pending_using_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request_id** | **String**| Identificador de los beneficiarios a eliminar | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

nil (empty response body)

### Authorization

[wire4_aut_app_user_spei](../README.md#wire4_aut_app_user_spei)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **update_amount_limit_account_using_put**
> update_amount_limit_account_using_put(account, request_dto, subscription)

Actualiza el monto límite

Actualiza el monto límite a la cuenta de beneficiario proporcionada relacionada al contrato perteneciente a la subscripción.

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app_user_spei
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

account = 'account_example' # String | Cuenta a actualizar

request_dto = Wire4Client::AmountRequest.new # AmountRequest | Información de la cuenta y el monto límite a actualizar

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Actualiza el monto límite
  api_instance.update_amount_limit_account_using_put(account, request_dto, subscription)
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPEIApi->update_amount_limit_account_using_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account** | **String**| Cuenta a actualizar | 
 **request_dto** | [**AmountRequest**](AmountRequest.md)| Información de la cuenta y el monto límite a actualizar | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

nil (empty response body)

### Authorization

[wire4_aut_app_user_spei](../README.md#wire4_aut_app_user_spei)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



