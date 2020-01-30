# Wire4Client::Payment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account** | **String** | Cuenta emisora | [optional] 
**amount** | **Float** | Monto de la transferencia | [optional] 
**beneficiary_account** | **String** | Cuenta del beneficiario | [optional] 
**beneficiary_bank** | [**Institution**](Institution.md) | Información del banco beneficiario | [optional] 
**beneficiary_name** | **String** | Nombre del Beneficiario | [optional] 
**cep** | [**MessageCEP**](MessageCEP.md) | CEP emitido por Banxico de la transferencia, sólo en caso de que este disponible en banxico, posteriomente  podrá usar la consulta de CEP del API | [optional] 
**clave_rastreo** | **String** | Clave de rastreo de la transferencia | [optional] 
**concept** | **String** | Concepto de pago | [optional] 
**confirm_date** | **DateTime** | Fecha de aplicación de la transferencia | [optional] 
**currency_code** | **String** | Código de moneda de la transferencia | [optional] 
**detention_message** | **String** | Mensaje proporcionado por Monex para la transferencia | [optional] 
**monex_description** | **String** | Descripción | [optional] 
**order_id** | **String** | Identificador asignado por la aplciación a la transferencia | [optional] 
**payment_order_id** | **Integer** | Identificador de la orden de pago en Monex | [optional] 
**reference** | **Integer** | Referencia numérica | [optional] 
**status_code** | **String** | Estado de la transferencia de la transferencia, los posibles valores son: PENDING, COMPLETED, FAILED, CANCELLED | [optional] 
**transaction_id** | **Integer** | Identificador de la transferencia asignado por Monex | [optional] 


