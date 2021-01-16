# Wire4Client::MessagePayment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account** | **String** | Es la cuenta del ordenante. | [optional] 
**amount** | **Float** | Es el monto de la transferencia. | [optional] 
**beneficiary_account** | **String** | Es la cuenta del beneficiario. | [optional] 
**beneficiary_bank** | [**MessageInstitution**](MessageInstitution.md) | Es el banco del beneficiario. | [optional] 
**beneficiary_name** | **String** | Es el nombre del beneficiario. | [optional] 
**cep** | [**MessageCEP**](MessageCEP.md) | Es el objeto con la información del Comprobante Electrónico de Pago (CEP). | [optional] 
**clave_rastreo** | **String** | Es la clave de rastreo de la transferencia. | [optional] 
**concept** | **String** | Es el concepto de la transferencia de salida. | [optional] 
**confirm_date** | **DateTime** | Es la fecha de confirmación de la transferencia de salida. | [optional] 
**currency_code** | **String** | Código de divisa de la transferencia de salida. Es en el formato estándar ISO 4217 y es de 3 dígitos. Ejemplo: \&quot;MXN\&quot;. | [optional] 
**detention_message** | **String** | Es el mensaje de detención de Monex de la transferencia de salida. | [optional] 
**error_message** | **String** | Mensaje de error. | [optional] 
**monex_description** | **String** | La descripción de Monex de la transferencia de salida. | [optional] 
**order_id** | **String** | Es el identificador de la transferencia de salida. | [optional] 
**payment_order_id** | **Integer** | Es el identificador de la orden de pago de Monex de la transferencia de salida. | [optional] 
**pending_reason** | **String** | Es la razón de porque está pendiente aún cuando se autorizó la transferencia. | [optional] 
**reference** | **Integer** | Es la referecia de la transferencia. | [optional] 
**request_id** | **String** | El identificador en esta API de la petición de envío de la transferencia de salida. | [optional] 
**status_code** | **String** | Es el estado de la transferencia de salida. | [optional] 
**transaction_id** | **Integer** | Es el identificador de Monex de la transferencia de salida. | [optional] 


