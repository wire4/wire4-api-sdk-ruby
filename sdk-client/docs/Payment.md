# Wire4Client::Payment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account** | **String** | Es la uenta emisora. | [optional] 
**amount** | **Float** | Es el monto de la transferencia. | [optional] 
**beneficiary_account** | **String** | Es la cuenta del beneficiario. | [optional] 
**beneficiary_bank** | [**Institution**](Institution.md) | Es la información del banco beneficiario. | [optional] 
**beneficiary_name** | **String** | Es el nombre del Beneficiario. | [optional] 
**cep** | [**MessageCEP**](MessageCEP.md) | Es el Comprobante Electrónico de Pago (CEP) emitido por Banxico de la transferencia. Sólo en caso de que este disponible en Banxico, posteriomente podrá usar la &lt;a href&#x3D;\&quot;#operation/obtainTransactionCepUsingPOST\&quot;&gt;Consulta de CEP&lt;/a&gt; que ésta misma API ofrece. | [optional] 
**clave_rastreo** | **String** | Es la clave de rastreo de la transferencia. | [optional] 
**concept** | **String** | Es el concepto de pago. | [optional] 
**confirm_date** | **DateTime** | Es la fecha de aplicación de la transferencia. Ésta fecha viene en formato ISO 8601 con zona horaria, ejemplo: &lt;strong&gt;2020-10-27T11:03:15.000-06:00&lt;/strong&gt;. | [optional] 
**currency_code** | **String** | Es el código de divisa de la transferencia. Es en el formato estándar de 3 dígitos. Ejemplo del peso mexicano: &lt;b&gt;MXP&lt;/b&gt;, ejemplo del dólar estadounidense: &lt;b&gt;USD&lt;/b&gt;. | [optional] 
**detention_message** | **String** | Es el mensaje proporcionado por Monex para la transferencia. | [optional] 
**error_message** | **String** | Es el mensaje de error, en caso de algún error se informará aquí. | [optional] 
**monex_description** | **String** | Es la descripción de Monex. | [optional] 
**order_id** | **String** | Es el identificador asignado por la aplciación a la transferencia. | [optional] 
**payment_order_id** | **Integer** | Es el identificador de la orden de pago en Monex. | [optional] 
**pending_reason** | **String** | Es la razón de porque esta pendiente aún cuando se autorizó la transferencia. | [optional] 
**reference** | **Integer** | Es la referencia numérica. | [optional] 
**status_code** | **String** | Es el estado de la transferencia de la transferencia, los posibles valores son: &lt;b&gt;PENDING, COMPLETED, FAILED, CANCELLED&lt;/b&gt; | [optional] 
**transaction_id** | **Integer** | Es el identificador de la transferencia asignado por Monex. | [optional] 


