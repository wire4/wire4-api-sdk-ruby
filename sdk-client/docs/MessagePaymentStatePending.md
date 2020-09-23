# Wire4Client::MessagePaymentStatePending

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account** | **String** | Cuenta del ordenante | [optional] 
**amount** | **Float** | Monto de la transferencia | [optional] 
**beneficiary_account** | **String** | Cuenta del beneficiario | [optional] 
**beneficiary_bank** | [**MessageInstitution**](MessageInstitution.md) | Banco del beneficiario | [optional] 
**beneficiary_name** | **String** | Nombre del beneficiario | [optional] 
**concept** | **String** | Concepto de la transferencia de salida | [optional] 
**currency_code** | **String** | Código de la moneda de la transferencia de salida | [optional] 
**detention_message** | **String** | Mensaje de detención de Monex, indica la causa por la cuál esta detenida la operación en Monex | [optional] 
**error_message** | **String** | Mensaje de error | [optional] 
**order_id** | **String** | El identificador de la transferencia de salida | [optional] 
**payment_order_id** | **Integer** | El identificador de la orden de pago de Monex de la transferencia de salida | [optional] 
**pending_reason** | **String** | Estatus que identifica la causa por la que la transferencia esta en pendiente, los posibles estatus son: FI&#x3D;Fondos Insuficientes | FM&#x3D;Firma mancomunada, en espera de ingreso de segundo token de autorización | DP&#x3D;Se detecto una transferencia duplicada que esta en espera de confirmación o de eliminación | [optional] 
**reference** | **Integer** | Referecia de la transferencia | [optional] 
**request_id** | **String** | El identificador, en esta API, de la petición de envío de la transferencia de salida | [optional] 
**status_code** | **String** | El estado de la transferencia de salida, deberá ser PENDING | [optional] 
**transaction_id** | **Integer** | El identificador de Monex de la transferencia de salida, podría no estar presente por lo que Usted debería hacer referencias mediate el paymentOrderID | [optional] 


