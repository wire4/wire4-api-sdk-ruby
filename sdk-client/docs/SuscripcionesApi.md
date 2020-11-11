# Wire4Client::SuscripcionesApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**change_subscription_status_using_put**](SuscripcionesApi.md#change_subscription_status_using_put) | **PUT** /subscriptions/{subscription}/status | Cambia el estatus de la suscripción
[**pre_enrollment_monex_user_using_post**](SuscripcionesApi.md#pre_enrollment_monex_user_using_post) | **POST** /subscriptions/pre-subscription | Registra una pre-suscripción
[**remove_enrollment_user_using_delete**](SuscripcionesApi.md#remove_enrollment_user_using_delete) | **DELETE** /subscriptions/{subscription} | Elimina una suscripción por el identificador de la suscripción
[**remove_subscription_pending_status_using_delete**](SuscripcionesApi.md#remove_subscription_pending_status_using_delete) | **DELETE** /subscriptions/pre-subscription/{subscription} | Elimina una pre-suscripción


# **change_subscription_status_using_put**
> change_subscription_status_using_put(authorization, request, subscription)

Cambia el estatus de la suscripción

Se cambia el estatus de la suscripción, los posibles valores son ACTIVE ó INACTIVE

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::SuscripcionesApi.new

authorization = 'authorization_example' # String | Header para token

request = Wire4Client::SubscriptionChangeStatusRequest.new # SubscriptionChangeStatusRequest | request

subscription = 'subscription_example' # String | subscription


begin
  #Cambia el estatus de la suscripción
  api_instance.change_subscription_status_using_put(authorization, request, subscription)
rescue Wire4Client::ApiError => e
  puts "Exception when calling SuscripcionesApi->change_subscription_status_using_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **request** | [**SubscriptionChangeStatusRequest**](SubscriptionChangeStatusRequest.md)| request | 
 **subscription** | **String**| subscription | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*



# **pre_enrollment_monex_user_using_post**
> PreEnrollmentResponse pre_enrollment_monex_user_using_post(authorization, pre_enrollment_data)

Registra una pre-suscripción

Registra una pre-suscripción para operar un contrato a través de un aplicación socio de la plataforma, proporcionando una URL donde el cliente Monex debe autorizar el acceso a los datos de su cuenta a el socio.<br/>Una vez que el cuentahabiente autorice el acceso, se envía un mensaje webhook con el evento 'ENROLLMENT.CREATED', el cuál contiene los datos de acceso a esta API.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::SuscripcionesApi.new

authorization = 'authorization_example' # String | Header para token

pre_enrollment_data = Wire4Client::PreEnrollmentData.new # PreEnrollmentData | Información para la pre-suscripción


begin
  #Registra una pre-suscripción
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
 **pre_enrollment_data** | [**PreEnrollmentData**](PreEnrollmentData.md)| Información para la pre-suscripción | 

### Return type

[**PreEnrollmentResponse**](PreEnrollmentResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **remove_enrollment_user_using_delete**
> remove_enrollment_user_using_delete(authorization, subscription)

Elimina una suscripción por el identificador de la suscripción

Elimina una suscripción, una vez eliminada ya no se podrán realizar operacions en el API utilizando esta suscripción

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::SuscripcionesApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Elimina una suscripción por el identificador de la suscripción
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

Elimina una pre-suscripción

Se elimina una pre-suscripción, sólo se elimina en caso de que el cliente Monex no haya concedido su autorización de acceso (token), es decir que la pre-suscripcion este pendiente.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::SuscripcionesApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | El identificador de la suscripción a esta API


begin
  #Elimina una pre-suscripción
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



