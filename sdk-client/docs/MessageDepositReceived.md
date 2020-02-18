# Wire4Client::MessageDepositReceived

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | Monto de la transferencia | [optional] 
**beneficiary_account** | **String** | Cuenta del beneficiario | [optional] 
**beneficiary_name** | **String** | Nombre del beneficiario | [optional] 
**beneficiary_rfc** | **String** | RFC del beneficiario | [optional] 
**cep** | [**MessageCEP**](MessageCEP.md) | Informacion del CEP | [optional] 
**clave_rastreo** | **String** | Clave de rastreo de la transferencia | [optional] 
**confirm_date** | **DateTime** | Fecha de confirmación de la transferencia | [optional] 
**currency_code** | **String** | Código de moneda de la transferencia, puede ser MXP, USD | [optional] 
**deposit_date** | **DateTime** | Fecha de recepción de la transferencia | [optional] 
**depositant** | **String** | Nombre del depositante, en caso que la transferencia se reciba en una cuenta de depositante | [optional] 
**depositant_clabe** | **String** | CLABE del depositante, en caso que la transferencia se reciba en una cuenta de depositante | [optional] 
**depositant_email** | **String** | Correo electrónico del depositante, en caso que la transferencia se reciba en una cuenta de depositante | [optional] 
**depositant_rfc** | **String** | RFC del depositante, en caso que la transferencia se reciba en una cuenta de depositante | [optional] 
**description** | **String** | Concepto de la transferencia | [optional] 
**monex_description** | **String** | Descripción de Monex para la transferencia | [optional] 
**monex_transaction_id** | **String** | Identificador asignado por Monex a la transferencia | [optional] 
**reference** | **String** | Referecia de la transferencia | [optional] 
**sender_account** | **String** | Cuenta del ordenante, podría ser un número celular, TDD o Cuenta CLABE interbancaria | [optional] 
**sender_bank** | [**MessageInstitution**](MessageInstitution.md) | Información del banco del ordenante | [optional] 
**sender_name** | **String** | Nombre del ordenante | [optional] 
**sender_rfc** | **String** | RFC del ordenante | [optional] 


