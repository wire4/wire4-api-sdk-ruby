# Wire4Client::CuentasDeBeneficiariosSPEIApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authorize_accounts_pending_put**](CuentasDeBeneficiariosSPEIApi.md#authorize_accounts_pending_put) | **PUT** /subscriptions/{subscription}/beneficiaries/pending | Solicitud para agrupar cuentas de beneficiarios SPEI/SPID en estado pendiente.
[**delete_account_using_delete**](CuentasDeBeneficiariosSPEIApi.md#delete_account_using_delete) | **DELETE** /subscriptions/{subscription}/beneficiaries/spei/{account} | Elimina la cuenta del beneficiario
[**get_available_relationships_monex_using_get**](CuentasDeBeneficiariosSPEIApi.md#get_available_relationships_monex_using_get) | **GET** /subscriptions/{subscription}/beneficiaries/relationships | Consulta de relaciones
[**get_beneficiaries_by_request_id**](CuentasDeBeneficiariosSPEIApi.md#get_beneficiaries_by_request_id) | **GET** /subscriptions/{subscription}/beneficiaries/spei/{requestId} | Consulta los beneficiarios por el identificador de la petición de registro
[**get_beneficiaries_for_account_using_get**](CuentasDeBeneficiariosSPEIApi.md#get_beneficiaries_for_account_using_get) | **GET** /subscriptions/{subscription}/beneficiaries/spei | Consulta los beneficiarios registrados
[**pre_register_accounts_using_post**](CuentasDeBeneficiariosSPEIApi.md#pre_register_accounts_using_post) | **POST** /subscriptions/{subscription}/beneficiaries/spei | Pre-registro de cuentas de beneficiarios SPEI®.
[**remove_beneficiaries_pending_using_delete**](CuentasDeBeneficiariosSPEIApi.md#remove_beneficiaries_pending_using_delete) | **DELETE** /subscriptions/{subscription}/beneficiaries/spei/request/{requestId} | Eliminación de beneficiarios SPEI® sin confirmar
[**update_amount_limit_account_using_put**](CuentasDeBeneficiariosSPEIApi.md#update_amount_limit_account_using_put) | **PUT** /subscriptions/{subscription}/beneficiaries/spei/{account} | Solicitud para actualizar el monto límite de una cuenta


# **authorize_accounts_pending_put**
> AuthorizedBeneficiariesResponse authorize_accounts_pending_put(authorization, subscription, urls_redirect_dto)

Solicitud para agrupar cuentas de beneficiarios SPEI/SPID en estado pendiente.

Solicta la agrupación de las cuentas de beneficiarios en estado pendiente para que sean autorizadas,  para ello se crea un conjunto de éstas que puede incluir tanto de SPEI como de SPID. Además se debe indicar las urls de redirección en caso de error y éxito

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.

urls_redirect_dto = Wire4Client::UrlsRedirect.new # UrlsRedirect | Información de la cuenta del beneficiario


begin
  #Solicitud para agrupar cuentas de beneficiarios SPEI/SPID en estado pendiente.
  result = api_instance.authorize_accounts_pending_put(authorization, subscription, urls_redirect_dto)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPEIApi->authorize_accounts_pending_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 
 **urls_redirect_dto** | [**UrlsRedirect**](UrlsRedirect.md)| Información de la cuenta del beneficiario | 

### Return type

[**AuthorizedBeneficiariesResponse**](AuthorizedBeneficiariesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_account_using_delete**
> delete_account_using_delete(authorization, account, subscription)

Elimina la cuenta del beneficiario

Elimina la cuenta de beneficiario proporcionada relacionada al contrato perteneciente a la suscripción. La cuenta a borrar debe ser una que opere con SPEI.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

authorization = 'authorization_example' # String | Header para token

account = 'account_example' # String | Es la cuenta del beneficiario que será eliminada.

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.


begin
  #Elimina la cuenta del beneficiario
  api_instance.delete_account_using_delete(authorization, account, subscription)
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPEIApi->delete_account_using_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **account** | **String**| Es la cuenta del beneficiario que será eliminada. | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_available_relationships_monex_using_get**
> RelationshipsResponse get_available_relationships_monex_using_get(authorization, subscription)

Consulta de relaciones

Obtiene las posibles relaciones existentes para registrar beneficiarios en Monex. Se debe invocar este recurso antes de pre-registrar una cuenta de beneficiario.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.


begin
  #Consulta de relaciones
  result = api_instance.get_available_relationships_monex_using_get(authorization, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPEIApi->get_available_relationships_monex_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 

### Return type

[**RelationshipsResponse**](RelationshipsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_beneficiaries_by_request_id**
> BeneficiariesResponse get_beneficiaries_by_request_id(authorization, request_id, subscription)

Consulta los beneficiarios por el identificador de la petición de registro

Obtiene los beneficiarios enviados para registro en una petición al contrato relacionado con la suscripción, Los beneficiarios son los que actualmente se encuentran registrados en banca Monex, que pertenezcan a la petición que se solicita.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

authorization = 'authorization_example' # String | Header para token

request_id = 'request_id_example' # String | El identificador de la petición del registro de beneficiarios a esta API.

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.


begin
  #Consulta los beneficiarios por el identificador de la petición de registro
  result = api_instance.get_beneficiaries_by_request_id(authorization, request_id, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPEIApi->get_beneficiaries_by_request_id: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **request_id** | **String**| El identificador de la petición del registro de beneficiarios a esta API. | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 

### Return type

[**BeneficiariesResponse**](BeneficiariesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_beneficiaries_for_account_using_get**
> BeneficiariesResponse get_beneficiaries_for_account_using_get(authorization, subscription, opts)

Consulta los beneficiarios registrados

Obtiene los beneficiarios registrados al contrato relacionado con la suscripción, Los beneficiarios son los que actualmente se encuentran registrados en banca Monex.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.

opts = { 
  account: 'account_example', # String | Es la cuenta del beneficiario, podría ser teléfono celular (es de 10 dígitos), Tarjeta de débito (TDD, es de 16 dígitos) o cuenta CLABE (es de 18 dígitos). <br/><br/>Por ejemplo Teléfono celular: 5525072600, TDD: 4323 1234 5678 9123, CLABE: 032180000118359719.
  beneficiary_bank: 'beneficiary_bank_example', # String | Es la clave del banco beneficiario. Se puede obtener del recurso de las <a href=\"#operation/getAllInstitutionsUsingGET\">instituciones.</a>
  beneficiary_name: 'beneficiary_name_example', # String | Es el nombre del beneficiario.
  end_date: 'end_date_example', # String | Es la fecha de inicio del perido a filtrar en formato dd-mm-yyyy.
  init_date: 'init_date_example', # String | Es la fºecha de inicio del perido a filtrar en formato dd-mm-yyyy.
  page: '0', # String | Es el número de página.
  rfc: 'rfc_example', # String | Es el Registro Federal de Controbuyentes (RFC) del beneficiario.
  size: '20', # String | Es el tamaño de página.
  status: 'status_example' # String | Es el estado (estatus) de la cuenta. Los valores pueden ser <b>PENDING</b> y <b>REGISTERED</b>.
}

begin
  #Consulta los beneficiarios registrados
  result = api_instance.get_beneficiaries_for_account_using_get(authorization, subscription, opts)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPEIApi->get_beneficiaries_for_account_using_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 
 **account** | **String**| Es la cuenta del beneficiario, podría ser teléfono celular (es de 10 dígitos), Tarjeta de débito (TDD, es de 16 dígitos) o cuenta CLABE (es de 18 dígitos). &lt;br/&gt;&lt;br/&gt;Por ejemplo Teléfono celular: 5525072600, TDD: 4323 1234 5678 9123, CLABE: 032180000118359719. | [optional] 
 **beneficiary_bank** | **String**| Es la clave del banco beneficiario. Se puede obtener del recurso de las &lt;a href&#x3D;\&quot;#operation/getAllInstitutionsUsingGET\&quot;&gt;instituciones.&lt;/a&gt; | [optional] 
 **beneficiary_name** | **String**| Es el nombre del beneficiario. | [optional] 
 **end_date** | **String**| Es la fecha de inicio del perido a filtrar en formato dd-mm-yyyy. | [optional] 
 **init_date** | **String**| Es la fºecha de inicio del perido a filtrar en formato dd-mm-yyyy. | [optional] 
 **page** | **String**| Es el número de página. | [optional] [default to 0]
 **rfc** | **String**| Es el Registro Federal de Controbuyentes (RFC) del beneficiario. | [optional] 
 **size** | **String**| Es el tamaño de página. | [optional] [default to 20]
 **status** | **String**| Es el estado (estatus) de la cuenta. Los valores pueden ser &lt;b&gt;PENDING&lt;/b&gt; y &lt;b&gt;REGISTERED&lt;/b&gt;. | [optional] 

### Return type

[**BeneficiariesResponse**](BeneficiariesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **pre_register_accounts_using_post**
> TokenRequiredResponse pre_register_accounts_using_post(authorization, request_dto, subscription)

Pre-registro de cuentas de beneficiarios SPEI®.

Pre-registra una o más cuentas de beneficiario en la plataforma de Wire4, ésta le proporcionará una URL donde lo llevará al centro de autorización para que el cuentahabiente Monex ingrese su llave digital para confirmar el alta de las cuentas de beneficiarios.<br/> Los posibles valores de <em>relationship</em> y <em>kind_of_relationship</em> se deben  obtener de <a href=\"#operation/getAvailableRelationshipsMonexUsingGET\">/subscriptions/{subscription}/beneficiaries/relationships.</a><br/><br/>La confirmación de registro en Monex se realizará a través de una notificación a los webhooks registrados con el evento de tipo <a href=\"#section/Eventos/Tipos-de-Eventos\">ACCOUNT.CREATED.</a>

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

authorization = 'authorization_example' # String | Header para token

request_dto = Wire4Client::AccountRequest.new # AccountRequest | Información de la cuenta del beneficiario

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.


begin
  #Pre-registro de cuentas de beneficiarios SPEI®.
  result = api_instance.pre_register_accounts_using_post(authorization, request_dto, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPEIApi->pre_register_accounts_using_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **request_dto** | [**AccountRequest**](AccountRequest.md)| Información de la cuenta del beneficiario | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 

### Return type

[**TokenRequiredResponse**](TokenRequiredResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **remove_beneficiaries_pending_using_delete**
> remove_beneficiaries_pending_using_delete(authorization, request_id, subscription)

Eliminación de beneficiarios SPEI® sin confirmar

Elimina uno o más beneficiarios que se encuentran en estado pendiente de confirmar (autorizar) de la cuenta del cliente Monex relacionada a la suscripción.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

authorization = 'authorization_example' # String | Header para token

request_id = 'request_id_example' # String | Es el identificador con el que se dió de alta a los beneficiarios (viene en el cuerpo de la respuesta del <a href=\"#operation/getAvailableRelationshipsMonexUsingGET\">pre-registro de beneficiarios</a>), los registros bajo éste campo van a ser eliminados.

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.


begin
  #Eliminación de beneficiarios SPEI® sin confirmar
  api_instance.remove_beneficiaries_pending_using_delete(authorization, request_id, subscription)
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPEIApi->remove_beneficiaries_pending_using_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **request_id** | **String**| Es el identificador con el que se dió de alta a los beneficiarios (viene en el cuerpo de la respuesta del &lt;a href&#x3D;\&quot;#operation/getAvailableRelationshipsMonexUsingGET\&quot;&gt;pre-registro de beneficiarios&lt;/a&gt;), los registros bajo éste campo van a ser eliminados. | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **update_amount_limit_account_using_put**
> TokenRequiredResponse update_amount_limit_account_using_put(authorization, account, request_dto, subscription)

Solicitud para actualizar el monto límite de una cuenta

Se crea una solicitud para actualizar el monto límite a la cuenta de beneficiario proporcionada y relacionada al contrato perteneciente a la subscripción. Una vez enviada la solicitud se retornará una URl que lo llevará al centro de autorización para que el cuentahabiente Monex ingrese su llave digital para confirmar la actualización del monto límite. 

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

authorization = 'authorization_example' # String | Header para token

account = 'account_example' # String | Es la cuenta que va a ser actualizada.

request_dto = Wire4Client::AmountRequest.new # AmountRequest | Información de la cuenta y el monto límite a actualizar.

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.


begin
  #Solicitud para actualizar el monto límite de una cuenta
  result = api_instance.update_amount_limit_account_using_put(authorization, account, request_dto, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPEIApi->update_amount_limit_account_using_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **account** | **String**| Es la cuenta que va a ser actualizada. | 
 **request_dto** | [**AmountRequest**](AmountRequest.md)| Información de la cuenta y el monto límite a actualizar. | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 

### Return type

[**TokenRequiredResponse**](TokenRequiredResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



