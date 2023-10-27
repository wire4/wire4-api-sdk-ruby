# Wire4Client::CargosRecurrentesApi

All URIs are relative to *https://sandbox-api.wire4.mx/wire4/1.0.0*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_recurring_charge_using_delete**](CargosRecurrentesApi.md#delete_recurring_charge_using_delete) | **DELETE** /recurring-charge/{orderId} | Cancelación/desubscripción de cargos recurrentes
[**register_recurring_charge_using_post**](CargosRecurrentesApi.md#register_recurring_charge_using_post) | **POST** /recurring-charge | Registro de cargos recurrentes


# **delete_recurring_charge_using_delete**
> ConfirmRecurringCharge delete_recurring_charge_using_delete(authorization, order_id)

Cancelación/desubscripción de cargos recurrentes

 Se solicita la desuscripción de un cargo recurrente activo. En el request llevará el orderId que identifica el cargo recurrente a eliminar/dar de baja se deshabilitará tanto de openpay como del sistem wire4.<br> Nota: Debe considerar que para hacer uso de esta funcionalidad debe contar con un scope  especial

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::CargosRecurrentesApi.new

authorization = 'authorization_example' # String | Header para token

order_id = 'order_id_example' # String | orderId


begin
  #Cancelación/desubscripción de cargos recurrentes
  result = api_instance.delete_recurring_charge_using_delete(authorization, order_id)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling CargosRecurrentesApi->delete_recurring_charge_using_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **order_id** | **String**| orderId | 

### Return type

[**ConfirmRecurringCharge**](ConfirmRecurringCharge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **register_recurring_charge_using_post**
> ConfirmRecurringCharge register_recurring_charge_using_post(authorization, request_recurring_charge)

Registro de cargos recurrentes

 Se registra una solicitud para generar un plan de cargos recurrentes. En la respuesta se proporcionará una dirección URL que lo llevará al sitio donde se le solicitará ingresar los datos de tarjeta a la que se aplicarán los cargos de acuerdo al plan seleccionado.<br> Nota: Debe considerar que para hacer uso de esta funcionalidad debe contar con un scope  especial

### Example
```ruby
# load the gem
require 'wire4_client'

api_instance = Wire4Client::CargosRecurrentesApi.new

authorization = 'authorization_example' # String | Header para token

request_recurring_charge = Wire4Client::RecurringChargeRequest.new # RecurringChargeRequest | Información de la solicitud para aplicar cargos recurrentes


begin
  #Registro de cargos recurrentes
  result = api_instance.register_recurring_charge_using_post(authorization, request_recurring_charge)
  p result
rescue Wire4Client::ApiError => e
  puts "Exception when calling CargosRecurrentesApi->register_recurring_charge_using_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Header para token | 
 **request_recurring_charge** | [**RecurringChargeRequest**](RecurringChargeRequest.md)| Información de la solicitud para aplicar cargos recurrentes | 

### Return type

[**ConfirmRecurringCharge**](ConfirmRecurringCharge.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



