# Wire4Client::Deposit

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | Es el monto de la transferencia. | [optional] 
**beneficiary_account** | **String** | Es la cuenta del beneficiario. | [optional] 
**beneficiary_name** | **String** | Es el nombre del beneficiario. | [optional] 
**beneficiary_rfc** | **String** | Es el Registro Federal de Contribuyentes (RFC) del beneficiario. | [optional] 
**cep** | [**MessageCEP**](MessageCEP.md) | Es el Comprobante Electrónico de Pago (CEP) emitido por Banxico que pertenece a la transferencia. Se informa sólo en caso de que esté disponible en banxico, posteriomente podrá usar la  &lt;a href&#x3D;\&quot;#operation/obtainTransactionCepUsingPOST\&quot;&gt;Consulta de CEP&lt;/a&gt; que ésta misma API ofrece. | [optional] 
**clave_rastreo** | **String** | Es la clave de rastreo de la transferencia. | [optional] 
**confirm_date** | **DateTime** | Es la fecha de confirmación del deposito. Ésta fecha viene en formato ISO 8601 con zona horaria, ejemplo: &lt;strong&gt;2020-10-27T11:03:15.000-06:00&lt;/strong&gt;. | [optional] 
**currency_code** | **String** | Es el código de divisa de la transferencia. Es en el formato estándar de 3 dígitos, por ejemplo para el peso mexicano: &lt;b&gt;MXP&lt;/b&gt;, para el dólar estadounidense: &lt;b&gt;USD&lt;/b&gt;. | [optional] 
**deposit_date** | **DateTime** | Es la fecha del deposito.  Ésta fecha viene en formato ISO 8601 con zona horaria, ejemplo: &lt;strong&gt;2020-10-27T11:03:15.000-06:00&lt;/strong&gt;. | [optional] 
**depositant** | **String** | Es el depositante. | [optional] 
**depositant_clabe** | **String** | Es la Cuenta CLABE interbancaria (de 18 dígitos) del depositante. | [optional] 
**depositant_email** | **String** | Es el correo electrónico (email) del depositante. | [optional] 
**depositant_rfc** | **String** | Es el Registro Federal de Contribuyentes (RFC) del depositante. | [optional] 
**description** | **String** | Es la descripción del traspaso. | [optional] 
**monex_description** | **String** | Es la descripción directa de Monex. | [optional] 
**monex_transaction_id** | **String** | es el identificador de la transferencia en Monex. | [optional] 
**reference** | **String** | Es la referencia del depósito. | [optional] 
**sender_account** | **String** | Es la cuenta del ordenante. | [optional] 
**sender_bank** | [**MessageInstitution**](MessageInstitution.md) | Es el banco del ordenante. | [optional] 
**sender_name** | **String** | Es el nombre del ordenante. | [optional] 
**sender_rfc** | **String** | Es el Registro Federal de Contribuyentes (RFC) de la cuenta ordenante. | [optional] 


