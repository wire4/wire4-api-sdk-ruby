# Wire4Client::SuscripcionesApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**change_subscription_status_using_put**](SuscripcionesApi.md#change_subscription_status_using_put) | **PUT** /subscriptions/{subscription}/status | Cambia el estatus de la suscripción
[**change_subscription_use_using_patch**](SuscripcionesApi.md#change_subscription_use_using_patch) | **PATCH** /subscriptions/{subscription} | Cambia el uso de la suscripción
[**pre_enrollment_monex_user_using_post**](SuscripcionesApi.md#pre_enrollment_monex_user_using_post) | **POST** /subscriptions/pre-subscription | Pre-registro de una suscripción
[**remove_enrollment_user_using_delete**](SuscripcionesApi.md#remove_enrollment_user_using_delete) | **DELETE** /subscriptions/{subscription} | Elimina suscripción por su identificador.
[**remove_subscription_pending_status_using_delete**](SuscripcionesApi.md#remove_subscription_pending_status_using_delete) | **DELETE** /subscriptions/pre-subscription/{subscription} | Elimina pre-registro de suscripción


# **change_subscription_status_using_put**
> change_subscription_status_using_put(authorization, request, subscription)

Cambia el estatus de la suscripción

Se cambia el estado o estatus de la suscripción a los posibles valores que son: ACTIVE o INACTIVE

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



# **change_subscription_use_using_patch**
> ServiceBanking change_subscription_use_using_patch(authorization, request, subscription)

Cambia el uso de la suscripción

Se asigna o cambia el uso y el estatus que se le dará a la subscripción para los servicios SPEI y SPID en el manejo de Cobros y Pagos El status puede tener los posibles valores: ACTIVE o INACTIVE. El uso puede tener los posibles valores: WITHDRAWAL_DEPOSIT o WITHDRAWAL o DEPOSIT

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::SuscripcionesApi.new

authorization = 'authorization_example' # String | Header para token

request = Wire4Client::ServiceBanking.new # ServiceBanking | request

subscription = 'subscription_example' # String | subscription


begin
  #Cambia el uso de la suscripción
  result = api_instance.change_subscription_use_using_patch(authorization, request, subscription)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling SuscripcionesApi->change_subscription_use_using_patch: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **request** | [**ServiceBanking**](ServiceBanking.md)| request | 
 **subscription** | **String**| subscription | 

### Return type

[**ServiceBanking**](ServiceBanking.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*



# **pre_enrollment_monex_user_using_post**
> PreEnrollmentResponse pre_enrollment_monex_user_using_post(authorization, pre_enrollment_data)

Pre-registro de una suscripción

Pre-registra una suscripción para operar un contrato a través de un aplicación socio de la plataforma. Se retorna una dirección URL hacia el centro de autorización donde el cliente  Monex debe autorizar el acceso a los datos de su cuenta a el socio.<br/><br/>Una vez que el cuentahabiente autorice el acceso, se envía una notificación (webhook configurado) con el evento 'ENROLLMENT.CREATED', el cuál contiene los datos de acceso a esta API.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::SuscripcionesApi.new

authorization = 'authorization_example' # String | Header para token

pre_enrollment_data = Wire4Client::PreEnrollmentData.new # PreEnrollmentData | Información para la pre-suscripción


begin
  #Pre-registro de una suscripción
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

Elimina suscripción por su identificador.

Elimina una suscripción mediante su identificador. Una vez eliminada dicha suscripción, ya no se podrán realizar operaciones en el API utilizando sus credenciales

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::SuscripcionesApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | El identificador de la suscripción a ésta API


begin
  #Elimina suscripción por su identificador.
  api_instance.remove_enrollment_user_using_delete(authorization, subscription)
rescue Wire4Client::ApiError => e
  puts "Exception when calling SuscripcionesApi->remove_enrollment_user_using_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| El identificador de la suscripción a ésta API | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*



# **remove_subscription_pending_status_using_delete**
> remove_subscription_pending_status_using_delete(authorization, subscription)

Elimina pre-registro de suscripción

Se elimina el pre-registro de suscripción. Sólo se elimina en caso de que el cliente Monex no haya concedido su autorización de acceso (token), es decir que la suscripcion esté pendiente.

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::SuscripcionesApi.new

authorization = 'authorization_example' # String | Header para token

subscription = 'subscription_example' # String | Es el identificador de la suscripción a esta API.


begin
  #Elimina pre-registro de suscripción
  api_instance.remove_subscription_pending_status_using_delete(authorization, subscription)
rescue Wire4Client::ApiError => e
  puts "Exception when calling SuscripcionesApi->remove_subscription_pending_status_using_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **subscription** | **String**| Es el identificador de la suscripción a esta API. | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*



