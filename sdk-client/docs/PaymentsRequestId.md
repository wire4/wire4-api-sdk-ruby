# Wire4Client::PaymentsRequestId

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**authorization_date** | **DateTime** | Fecha en que el usuario propietario del token emitió la autorización | [optional] 
**request_date** | **DateTime** | Fecha en que se realizó la petición de registro de transacciones | [optional] 
**request_id** | **String** | Identificador de la petición del registro de transacciones | [optional] 
**total_amount** | **Float** | Monto total de las transacciones registradas | [optional] 
**total_transactions** | **Integer** | Total de transacciones en la petición | [optional] 
**transactions** | [**Array&lt;Payment&gt;**](Payment.md) | Lista de las transacciones registradas | [optional] 


