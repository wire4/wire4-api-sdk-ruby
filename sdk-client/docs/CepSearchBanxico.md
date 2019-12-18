# Wire4Client::CepSearchBanxico

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | Monto de la transferencia | 
**beneficiary_account** | **String** | Cuenta de beneficiario | 
**beneficiary_bank_key** | **String** | Clave del banco beneficiario, se puede obtener este valor del listado de institucines &#39;/institutions&#39;. Si este valor no esta presente se obtiene de la cuenta del beneficiario, si la cuenta de beneficiario es un número celular este campo es requerido | [optional] 
**clave_rastreo** | **String** | Clave de rastreo de la transferencia | 
**operation_date** | **String** | Fecha de operación de la transferencia, formato: dd-MM-yyyy | 
**reference** | **String** | Referencia numérica de la transferencia | [optional] 
**sender_account** | **String** | Cuenta ordenante, es requerida cuando se no se envía la clave del banco ordenante  | [optional] 
**sender_bank_key** | **String** | Clave del banco ordenante, se puede obtener este valor del listado de institucines &#39;/institutions&#39;. Es requerida cuando no se envía la cuenta ordenante | [optional] 


