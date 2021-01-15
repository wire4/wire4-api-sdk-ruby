# Wire4Client::MessagePaymentStatePending

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account** | **String** | Es la cuenta del ordenante. | [optional] 
**amount** | **Float** | Es el monto de la transferencia. | [optional] 
**beneficiary_account** | **String** | Es la cuenta del beneficiario. | [optional] 
**beneficiary_bank** | [**MessageInstitution**](MessageInstitution.md) | Es el banco del beneficiario. | [optional] 
**beneficiary_name** | **String** | Es el nombre del beneficiario. | [optional] 
**concept** | **String** | Es el concepto de la transferencia de salida. | [optional] 
**currency_code** | **String** | Código de divisa de la transferencia de salida. Es en el formato estándar ISO 4217 y es de 3 dígitos. Ejemplo: \&quot;MXN\&quot;. | [optional] 
**detention_message** | **String** | Es el Mensaje de detención de Monex, indica la causa por la cuál esta detenida la operación en Monex. | [optional] 
**error_message** | **String** | Es el mensaje de error. | [optional] 
**order_id** | **String** | El identificador de la transferencia de salida. | [optional] 
**payment_order_id** | **Integer** | Es el identificador de la orden de pago de Monex de la transferencia de salida. | [optional] 
**pending_reason** | **String** | Es el esaado que identifica la causa por la que la transferencia se ecuentra detenida o  pendiente de procesarse. Los posibles estados son: &lt;ul&gt;&lt;li&gt;FI&#x3D;Fondos Insuficientes&lt;/li&gt;&lt;li&gt;FM&#x3D;Firma mancomunada, en espera de ingreso de segundo token de autorización&lt;/li&gt;&lt;li&gt;DP&#x3D;Se detecto una transferencia duplicada que esta en wspera de confirmación o de eliminación&lt;/li&gt;&lt;/ul&gt; | [optional] 
**reference** | **Integer** | Es la referecia de la transferencia. | [optional] 
**request_id** | **String** | Es el identificador, en esta API, de la petición de envío de la transferencia de salida. | [optional] 
**status_code** | **String** | Es el estado (estatus) de la transferencia de salida. Deberá ser \&quot;PENDING\&quot;. | [optional] 
**transaction_id** | **Integer** | Es el identificador de Monex de la transferencia de salida, podría no estar presente por lo que Usted debería hacer referencias mediate el paymentOrderID. | [optional] 


