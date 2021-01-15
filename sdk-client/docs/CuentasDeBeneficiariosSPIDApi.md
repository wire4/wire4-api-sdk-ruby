# Wire4Client::CuentasDeBeneficiariosSPIDApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_spid_beneficiaries_for_account**](CuentasDeBeneficiariosSPIDApi.md#get_spid_beneficiaries_for_account) | **GET** /subscriptions/{subscription}/beneficiaries/spid | Consulta los beneficiarios SPID registrados
[**pre_register_accounts_using_post1**](CuentasDeBeneficiariosSPIDApi.md#pre_register_accounts_using_post1) | **POST** /subscriptions/{subscription}/beneficiaries/spid | Pre-registro de cuentas de beneficiarios SPID®


# **get_spid_beneficiaries_for_account**
> SpidBeneficiariesResponse get_spid_beneficiaries_for_account(authorization, subscription, opts)

Consulta los beneficiarios SPID registrados

Obtiene los beneficiarios SPID registrados al contrato relacionado con la suscripción. Los beneficiarios son los que actualmente se encuentran registrados en banca Monex.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::CuentasDeBeneficiariosSPIDApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.

opts = { 
  account: 'account_example', # String | Cuenta del beneficiario, puede ser CLABE (18 dígitos), Tarjeta de débito  (TDD, 16 dígitos) o número de celular (10 dígitos).
  beneficiary_bank: 'beneficiary_bank_example', # String | Es la clave del banco beneficiario. Se puede obtener del catalogo de <a href=\"#operation/getAllInstitutionsUsingGET\">instituciones.</a>
  beneficiary_name: 'beneficiary_name_example', # String | Es el nombre del beneficiario.
  end_date: 'end_date_example', # String | Es la fecha de inicio del periodo a filtrar en formato dd-mm-yyyy.
  init_date: 'init_date_example', # String | Es la fecha de inicio del periodo a filtrar en formato dd-mm-yyyy.
  rfc: 'rfc_example', # String | Es el Registro Federal de Contribuyentes (RFC) del beneficiario.
  status: 'status_example' # String | Es el estado (estatus) de la cuenta, Los valores pueden ser <b>PENDING</b> y <b>REGISTERED</b>.
}

begin
  #Consulta los beneficiarios SPID registrados
  result = api_instance.get_spid_beneficiaries_for_account(authorization, subscription, opts)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPIDApi->get_spid_beneficiaries_for_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 
 **account** | **String**| Cuenta del beneficiario, puede ser CLABE (18 dígitos), Tarjeta de débito  (TDD, 16 dígitos) o número de celular (10 dígitos). | [optional] 
 **beneficiary_bank** | **String**| Es la clave del banco beneficiario. Se puede obtener del catalogo de &lt;a href&#x3D;\&quot;#operation/getAllInstitutionsUsingGET\&quot;&gt;instituciones.&lt;/a&gt; | [optional] 
 **beneficiary_name** | **String**| Es el nombre del beneficiario. | [optional] 
 **end_date** | **String**| Es la fecha de inicio del periodo a filtrar en formato dd-mm-yyyy. | [optional] 
 **init_date** | **String**| Es la fecha de inicio del periodo a filtrar en formato dd-mm-yyyy. | [optional] 
 **rfc** | **String**| Es el Registro Federal de Contribuyentes (RFC) del beneficiario. | [optional] 
 **status** | **String**| Es el estado (estatus) de la cuenta, Los valores pueden ser &lt;b&gt;PENDING&lt;/b&gt; y &lt;b&gt;REGISTERED&lt;/b&gt;. | [optional] 

### Return type

[**SpidBeneficiariesResponse**](SpidBeneficiariesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **pre_register_accounts_using_post1**
> TokenRequiredResponse pre_register_accounts_using_post1(authorization, request_spid_dto, subscription)

Pre-registro de cuentas de beneficiarios SPID®

Pre-registra una o más cuentas de beneficiario SPID® en la plataforma de Wire4, ésta le proporcionaará una URL donde lo llevará al centro de autorización para que el cuentahabiente Monex ingrese su llave digital para confirmar el alta de las cuentas de beneficiarios.<br/> Los posibles valores de <em>relationship</em> y <em>kind_of_relationship</em> se deben  obtener de <a href=\"#operation/getAvailableRelationshipsMonexUsingGET\">/subscriptions/{subscription}/beneficiaries/relationships.</a><br/><br/>La confirmación de registro en Monex se realizará a través de una notificación a los webhooks registrados con el evento de tipo <a href=\"#section/Eventos/Tipos-de-Eventos\">ACCOUNT.CREATED.</a>

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::CuentasDeBeneficiariosSPIDApi.new

authorization = 'authorization_example' # String | Header para token

request_spid_dto = Wire4Client::AccountSpid.new # AccountSpid | Información de la cuenta del beneficiario

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.


begin
  #Pre-registro de cuentas de beneficiarios SPID®
  result = api_instance.pre_register_accounts_using_post1(authorization, request_spid_dto, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPIDApi->pre_register_accounts_using_post1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **request_spid_dto** | [**AccountSpid**](AccountSpid.md)| Información de la cuenta del beneficiario | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 

### Return type

[**TokenRequiredResponse**](TokenRequiredResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



