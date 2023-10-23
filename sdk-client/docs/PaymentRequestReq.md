# Wire4Client::PaymentRequestReq

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | Es el monto de la solicitud de pago | 
**cancel_return_url** | **String** | Es la dirección URL a la que se redirigirá en caso de que el usuario cancele. | [optional] 
**customer** | [**Customer**](Customer.md) | Datos del cliente | [optional] 
**depositant_account** | **String** | Es el número de cuenta CLABE donde se realizará el deposito. | [optional] 
**description** | **String** | Es la descripción de la solicitud de pago. | [optional] 
**due_date** | **Date** | Es la fecha de operación de la solicitud de pago. | [optional] 
**from_date** | **Date** | Es la fecha de inicio de la solicitud de pago.  | [optional] 
**method** | **String** |  | 
**order_id** | **String** | Número de orden asignado por el cliente de Wire4 | 
**return_url** | **String** | Es la dirección URL a la que se redirigirá en caso de éxito. | [optional] 
**type** | **String** | Tipo de pago por paycash | [optional] 


