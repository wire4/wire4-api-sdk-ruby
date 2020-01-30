# Wire4Client::SuscripcionesApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**pre_enrollment_monex_user_using_post**](SuscripcionesApi.md#pre_enrollment_monex_user_using_post) | **POST** /subscriptions/pre-subscription | registra una pre-suscripción
[**remove_enrollment_user_using_delete**](SuscripcionesApi.md#remove_enrollment_user_using_delete) | **DELETE** /subscriptions/{subscription} | Elimna una suscripción por id
[**remove_subscription_pending_status_using_delete**](SuscripcionesApi.md#remove_subscription_pending_status_using_delete) | **DELETE** /subscriptions/pre-subscription/{subscription} | Elimna una pre-suscripción


# **pre_enrollment_monex_user_using_post**
> PreEnrollmentResponse pre_enrollment_monex_user_using_post(authorization, pre_enrollment_data)

registra una pre-suscripción

Pre-registra una suscripción para operar un contrato a través de un aplicación socio de la plataforma, proporcionando una URL donde el cliente Monex debe autorizar el acceso a los datos de su cuenta a el socio.<br/>Una vez que el cuentahabiente autorice el acceso, se envia un webhook con el evento ENROLLMENT.CREATED, el cual contiene los datos de acceso.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::SuscripcionesApi.new

authorization = 'authorization_example' # String | Header para token

pre_enrollment_data = Wire4Client::PreEnrollmentData.new # PreEnrollmentData | Información para el enrolamiento


begin
  #registra una pre-suscripción
  result = api_instance.pre_enrollment_monex_user_using_post(authorization, pre_enrollment_data)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling SuscripcionesApi->pre_enrollment_monex_user_using_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **pre_enrollment_data** | [**PreEnrollmentData**](PreEnrollmentData.md)| Información para el enrolamiento | 

### Return type

[**PreEnrollmentResponse**](PreEnrollmentResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **remove_enrollment_user_using_delete**
> remove_enrollment_user_using_delete(authorization, subscription)

Elimna una suscripción por id

Elimina una suscripción, una ves eliminada la suscripcion ya no se podran realizar operacions en el API uilizando esta suscripción

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::SuscripcionesApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Elimna una suscripción por id
  api_instance.remove_enrollment_user_using_delete(authorization, subscription)
rescue Wire4Client::ApiError => e
  puts "Exception when calling SuscripcionesApi->remove_enrollment_user_using_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*



# **remove_subscription_pending_status_using_delete**
> remove_subscription_pending_status_using_delete(authorization, subscription)

Elimna una pre-suscripción

Se elimina una pre-suscripción, sólo se elimina en caso de que cliente monex no haya concedio su autorización de acceso, es decir que la pre-suscripcion este pendiente.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::SuscripcionesApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Elimna una pre-suscripción
  api_instance.remove_subscription_pending_status_using_delete(authorization, subscription)
rescue Wire4Client::ApiError => e
  puts "Exception when calling SuscripcionesApi->remove_subscription_pending_status_using_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| El identificador de la suscripción a esta API | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*



