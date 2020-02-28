# Wire4Client::Deposit

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | Monto de la transferencia | [optional] 
**beneficiary_account** | **String** | La cuenta del beneficiario | [optional] 
**beneficiary_name** | **String** | El nombre del beneficiario | [optional] 
**beneficiary_rfc** | **String** | El RFC del beneficiario | [optional] 
**cep** | [**MessageCEP**](MessageCEP.md) | CEP emitido por Banxico de la transferencia, sólo en caso de que este disponible en banxico, posteriomente  podrá usar la consulta de CEP del API | [optional] 
**clave_rastreo** | **String** | La clave de rastreo de la transferencia | [optional] 
**confirm_date** | **DateTime** | Fecha de confirmación del deposito | [optional] 
**currency_code** | **String** | Código de moneda de la transferencia | [optional] 
**deposit_date** | **DateTime** | Fecha del deposito | [optional] 
**depositant** | **String** | Depositante | [optional] 
**depositant_clabe** | **String** | Cuenta CLABE interbancaria del depositante | [optional] 
**depositant_email** | **String** | Email del depositante | [optional] 
**depositant_rfc** | **String** | RFC del depositante | [optional] 
**description** | **String** | Descripción del traspaso | [optional] 
**monex_description** | **String** | Descripción directa de Monex | [optional] 
**monex_transaction_id** | **String** | Identificador de la transferencia en Monex | [optional] 
**reference** | **String** | La referencia del depósito | [optional] 
**sender_account** | **String** | La cuenta del ordenante | [optional] 
**sender_bank** | [**MessageInstitution**](MessageInstitution.md) | El banco del ordenante | [optional] 
**sender_name** | **String** | El nombre del ordenante | [optional] 
**sender_rfc** | **String** | El RFC del ordenante | [optional] 


