# Wire4Client::CodiCodeQrResponseDTO

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | Es el monto del pago CODI®. | [optional] 
**barcode_base64** | **String** | El código QR en su represantación base 64. | [optional] 
**barcode_url** | **String** | Es la dirección URL del código QR. | [optional] 
**concept** | **String** | Es la descripción del pago CODI®. | [optional] 
**creation_date** | **DateTime** | Es la fecha de creación del código QR para pago CODI®. Ésta fecha viene en formato ISO 8601 con zona horaria, ejemplo: &lt;strong&gt;2020-10-27T11:03:15.000-06:00&lt;/strong&gt;. | [optional] 
**due_date** | **DateTime** | Es la fecha de operación del pago CODI®. Ésta fecha viene en formato ISO 8601 con zona horaria, ejemplo: &lt;strong&gt;2020-10-27T11:03:15.000-06:00&lt;/strong&gt;. | [optional] 
**order_id** | **String** | Es la referencia de la transferencia asignada por el cliente. | [optional] 
**phone_number** | **String** | Es el Número de teléfono móvil en caso de ser un pago CODI® usando \&quot;PUSH_NOTIFICATION\&quot;. | [optional] 
**status** | **String** | El estado del código QR para pago CODI®. | [optional] 
**type** | **String** | Es el tipo de código QR para pago con CODI®. | [optional] 


