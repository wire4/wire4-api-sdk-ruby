# Wire4Client::MessagePayment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account** | **String** | Cuenta del ordenante | [optional] 
**amount** | **Float** | Monto de la transferencia | [optional] 
**beneficiary_account** | **String** | Cuenta del beneficiario | [optional] 
**beneficiary_bank** | [**MessageInstitution**](MessageInstitution.md) | Banco del beneficiario | [optional] 
**beneficiary_name** | **String** | Nombre del beneficiario | [optional] 
**cep** | [**MessageCEP**](MessageCEP.md) | Informacion del CEP | [optional] 
**clave_rastreo** | **String** | Clave de rastreo de la transferencia | [optional] 
**concept** | **String** | Concepto de la transferencia de salida | [optional] 
**confirm_date** | **DateTime** | Fecha de confirmación de la transferencia de salida | [optional] 
**currency_code** | **String** | Código de la moneda de la transferencia de salida | [optional] 
**detention_message** | **String** | Mensaje de detención de Monex de la transferencia de salida | [optional] 
**error_message** | **String** | Mensaje de error | [optional] 
**monex_description** | **String** | La descripción de Monex de la transferencia de salida | [optional] 
**order_id** | **String** | El identificador de la transferencia de salida | [optional] 
**payment_order_id** | **Integer** | El identificador de la orden de pago de Monex de la transferencia de salida | [optional] 
**pending_reason** | **String** | Razón de porque está pendiente aún cuando se autorizó la transferencia | [optional] 
**reference** | **Integer** | Referecia de la transferencia | [optional] 
**request_id** | **String** | El identificador, en esta API, de la petición de envío de la transferencia de salida | [optional] 
**status_code** | **String** | El estado de la transferencia de salida | [optional] 
**transaction_id** | **Integer** | El identificador de Monex de la transferencia de salida | [optional] 


