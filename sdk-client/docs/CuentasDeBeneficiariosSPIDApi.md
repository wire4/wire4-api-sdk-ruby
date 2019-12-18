# Wire4Client::CuentasDeBeneficiariosSPIDApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**pre_register_accounts_using_post1**](CuentasDeBeneficiariosSPIDApi.md#pre_register_accounts_using_post1) | **POST** /subscriptions/{subscription}/beneficiaries/spid | Pre-registro de cuentas de beneficiarios SPID


# **pre_register_accounts_using_post1**
> TokenRequiredResponse pre_register_accounts_using_post1(request_spid_dto, subscription)

Pre-registro de cuentas de beneficiarios SPID

### Example
```ruby
# load the gem
require 'wire4_client'
# setup authorization
Wire4Client.configure do |config|
  # Configure OAuth2 access token for authorization: wire4_aut_app_user_spid
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = Wire4Client::CuentasDeBeneficiariosSPIDApi.new

request_spid_dto = Wire4Client::AccountSpid.new # AccountSpid | Información de la cuenta del beneficiario

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Pre-registro de cuentas de beneficiarios SPID
  result = api_instance.pre_register_accounts_using_post1(request_spid_dto, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling CuentasDeBeneficiariosSPIDApi->pre_register_accounts_using_post1: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request_spid_dto** | [**AccountSpid**](AccountSpid.md)| Información de la cuenta del beneficiario | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

[**TokenRequiredResponse**](TokenRequiredResponse.md)

### Authorization

[wire4_aut_app_user_spid](../README.md#wire4_aut_app_user_spid)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



