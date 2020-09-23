# Wire4Client::CodiCodeRequestDTO

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | Monto del pago CODI® | [optional] 
**concept** | **String** | Descripción del pago CODI® | 
**due_date** | **DateTime** | Fecha de operación pago CODI®, formato: yyyy-MM-dd&#39;T&#39;HH:mm:ss | 
**metadata** | **String** | Campo de metada CODI®, longitud máxima determinada por configuracion de la empresa, por defecto 100 caracteres | [optional] 
**order_id** | **String** | Referencia de la transferencia asignada por el cliente | 
**phone_number** | **String** | Número de teléfono móvil en caso de ser un pago CODI® usando &#39;PUSH_NOTIFICATION&#39; estecampo sería obligatorio | [optional] 
**type** | **String** | El tipo de código QR para pago con CODI® | 


