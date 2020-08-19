# Wire4Client::CuentasDeBeneficiariosSPIDApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_spid_beneficiaries_for_account**](CuentasDeBeneficiariosSPIDApi.md#get_spid_beneficiaries_for_account) | **GET** /subscriptions/{subscription}/beneficiaries/spid | Consulta los beneficiarios SPID registrados
[**pre_register_accounts_using_post1**](CuentasDeBeneficiariosSPIDApi.md#pre_register_accounts_using_post1) | **POST** /subscriptions/{subscription}/beneficiaries/spid | Pre-registro de cuentas de beneficiarios SPID


# **get_spid_beneficiaries_for_account**
> SpidBeneficiariesResponse get_spid_beneficiaries_for_account(authorization, subscription, opts)

Consulta los beneficiarios SPID registrados

Obtiene los beneficiarios SPID registrados al contrato relacionado con la suscripción, Los beneficiarios son los que actualmente se encuentran registrados en banca Monex.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::CuentasDeBeneficiariosSPIDApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API

opts = { 
  account: 'account_example', # String | Cuenta del beneficiario, puede ser Clabe, TDD o Celular
  beneficiary_bank: 'beneficiary_bank_example', # String | Clave del banco beneficiario
  beneficiary_name: 'beneficiary_name_example', # String | Nombre del beneficiario
  end_date: 'end_date_example', # String | Fecha de inicio del perido a filtrar en formato dd-mm-yyyy
  init_date: 'init_date_example', # String | Fecha de inicio del perido a filtrar en formato dd-mm-yyyy
  rfc: 'rfc_example', # String | RFC del beneficiario
  status: 'status_example' # String | Estatus de la cuenta
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
 **subscription** | **String**| El identificador de la suscripción a esta API | 
 **account** | **String**| Cuenta del beneficiario, puede ser Clabe, TDD o Celular | [optional] 
 **beneficiary_bank** | **String**| Clave del banco beneficiario | [optional] 
 **beneficiary_name** | **String**| Nombre del beneficiario | [optional] 
 **end_date** | **String**| Fecha de inicio del perido a filtrar en formato dd-mm-yyyy | [optional] 
 **init_date** | **String**| Fecha de inicio del perido a filtrar en formato dd-mm-yyyy | [optional] 
 **rfc** | **String**| RFC del beneficiario | [optional] 
 **status** | **String**| Estatus de la cuenta | [optional] 

### Return type

[**SpidBeneficiariesResponse**](SpidBeneficiariesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **pre_register_accounts_using_post1**
> TokenRequiredResponse pre_register_accounts_using_post1(authorization, request_spid_dto, subscription)

Pre-registro de cuentas de beneficiarios SPID

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::CuentasDeBeneficiariosSPIDApi.new

authorization = 'authorization_example' # String | Header para token

request_spid_dto = Wire4Client::AccountSpid.new # AccountSpid | Información de la cuenta del beneficiario

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Pre-registro de cuentas de beneficiarios SPID
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
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

[**TokenRequiredResponse**](TokenRequiredResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



