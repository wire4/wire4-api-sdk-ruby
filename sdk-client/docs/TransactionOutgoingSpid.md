# Wire4Client::TransactionOutgoingSpid

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | Monto de la transferencia | 
**beneficiary_account** | **String** | Cuenta del beneficiario, podría ser un numero celular, TDD o Cuenta CLABE interbancaria  | 
**cancel_return_url** | **String** | Url a la que se redirigirá en caso de error | 
**classification_id** | **String** | El identificador de la clasificación de la transferencia SPID | 
**currency_code** | **String** | Código de moneda en la que opera la cuenta | 
**email** | **Array&lt;String&gt;** | Lista de email del beneficiario,es opcional | [optional] 
**numeric_reference_spid** | **Integer** | Referencia numérica de la transferencia | 
**order_id** | **String** | Referencia de la transferencia asignada por el cliente | 
**payment_concept_spid** | **String** | Concepto de la transferencia | 
**return_url** | **String** | Url a la que se redirigirá en caso de exito | 


