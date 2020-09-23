# Wire4Client::TransactionOutgoing

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | Monto de la transferencia | 
**beneficiary_account** | **String** | Cuenta del beneficiario, podría ser un número celular, TDD o Cuenta CLABE interbancaria  | 
**beneficiary_bank_key** | **String** | La clave del banco beneficiario, proprocionada por BANXICO, este campo solo es obligatario cuando la cuenta beneficiaria es un número celular (*). | [optional] 
**concept** | **String** | Concepto de la transferencia | 
**currency_code** | **String** | Código de moneda en la que opera la cuenta | 
**email** | **Array&lt;String&gt;** | Lista de email del beneficiario,es opcional | [optional] 
**order_id** | **String** | Referencia de la transferencia asignada por el cliente | 
**reference** | **Integer** | Referencia numérica de la transferencia | 


