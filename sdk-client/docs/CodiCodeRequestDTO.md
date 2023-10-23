# Wire4Client::CodiCodeRequestDTO

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | Monto del pago CODI® | [optional] 
**beneficiary2** | [**BeneficiaryDTO**](BeneficiaryDTO.md) |  | [optional] 
**concept** | **String** | Descripción del pago CODI®, no debe contener letras con acentos ni caracteres especiales | 
**due_date** | **DateTime** | Fecha de operación pago CODI®, formato: yyyy-MM-dd&#39;T&#39;HH:mm:ss | [optional] 
**metadata** | **String** | Campo de metada CODI®, longitud máxima determinada por configuracion de la empresa, por defecto 100 caracteres | [optional] 
**order_id** | **String** | Referencia de la transferencia asignada por el cliente | 
**payment_type** | **String** | El tipo de pago ya sea en una ocasión (ONE_OCCASION) o recurrente (RECURRENT) | 
**phone_number** | **String** | Número de teléfono móvil en caso de ser un pago CODI® usando &#39;PUSH_NOTIFICATION&#39; estecampo sería obligatorio | [optional] 
**reference** | **Integer** | Referencia numérica del pago CODI®. Debe ser de 7 dígitos | 
**type** | **String** | El tipo de solicitud QR o PUSH para pago con CODI® | 


