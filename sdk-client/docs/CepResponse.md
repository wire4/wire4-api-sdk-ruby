# Wire4Client::CepResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_beneficiary** | **String** | Es la cuenta del beneficiario. | [optional] 
**account_sender** | **String** | Es la cuenta del ordenante. | [optional] 
**amount** | **Float** | Es el monto de la transferencia. | [optional] 
**available** | **BOOLEAN** | Indica si el CEP se encuentra disponible o no. | [optional] 
**beneficiary_bank_key** | **String** | Es la clave del banco beneficiario el cual se puede obtener del recurso de las &lt;a href&#x3D;\&quot;#operation/getAllInstitutionsUsingGET\&quot;&gt;instituciones.&lt;/a&gt; | [optional] 
**beneficiary_name** | **String** | Nombre del beneficiario. | [optional] 
**beneficiary_rfc** | **String** | Es el Registro Federal de Contribuyentes (RFC) del beneficiario. | [optional] 
**cadena_original** | **String** | Cadena original del CEP. | [optional] 
**capture_date** | **DateTime** | Es la fecha de captura de la transferencia. Ésta fecha viene en formato ISO 8601 con zona horaria, ejemplo: &lt;strong&gt;2020-10-27T11:03:15.000-06:00&lt;/strong&gt;. | [optional] 
**certificate_serial_number** | **String** | Número de serie del certificado. | [optional] 
**clave_rastreo** | **String** | Es la clave de rastreo. | [optional] 
**description** | **String** | Es la descripción de la transferencia. | [optional] 
**iva** | **Float** | IVA de la transferencia. | [optional] 
**operation_date** | **DateTime** | Es la fecha de operación de la transferencia. Ésta fecha viene en formato ISO 8601 con zona horaria, ejemplo: &lt;strong&gt;2020-10-27T11:03:15.000-06:00&lt;/strong&gt;. | [optional] 
**operation_date_cep** | **DateTime** | Es la fecha de abono registrada en el CEP.  Ésta fecha viene en formato ISO 8601 con zona horaria, ejemplo: &lt;strong&gt;2020-10-27T11:03:15.000-06:00&lt;/strong&gt;. | [optional] 
**reference** | **String** | Es la referencia numérica de la transferencia. | [optional] 
**sender_bank_key** | **String** | Es la clave del banco emisor el cual se puede obtener del recurso de las &lt;a href&#x3D;\&quot;#operation/getAllInstitutionsUsingGET\&quot;&gt;instituciones.&lt;/a&gt; | [optional] 
**sender_name** | **String** | Es el nombre del emisor. | [optional] 
**sender_rfc** | **String** | Es el Registro Federal de Contribuyentes (RFC) del emisor. | [optional] 
**signature** | **String** | Firma del CEP.. | [optional] 
**type** | **String** | Es el tiop de CEP, puede ser: &lt;strong&gt;SPEI&lt;/strong&gt; o &lt;strong&gt;SPID&lt;/strong&gt;. | [optional] 
**url_zip** | **String** | La url al archivo zip del CEP, el cual contiene el xml y pdf | [optional] 


