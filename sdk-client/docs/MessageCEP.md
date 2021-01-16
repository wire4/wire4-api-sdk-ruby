# Wire4Client::MessageCEP

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_beneficiary** | **String** | Es la cuenta del beneficiario. | [optional] 
**account_sender** | **String** | Es la cuenta que envía la operación. | [optional] 
**amount** | **Float** | Es el monto de la operación. | [optional] 
**available** | **BOOLEAN** | Indica sí el CEP está disponible. | [optional] 
**bank_beneficiary** | **String** | Es la clave del banco beneficiario. | [optional] 
**bank_sender** | **String** | Es la clave del banco que envía la operación. | [optional] 
**beneficiary_name** | **String** | Es el nombre del beneficiario. | [optional] 
**beneficiary_rfc** | **String** | Es el Registro Federal de Contribuyentes (RFC) del beneficiario. | [optional] 
**cadena_original** | **String** | Es la cadena original emitida por el Servicio de Administración Tributaria (SAT). | [optional] 
**capture_date** | **DateTime** | Es la fecha de captura. | [optional] 
**certificate_serial_number** | **String** | Es el número de serie emitido por el SAT | [optional] 
**clave_rastreo** | **String** | Es la clave de rastreo de la operación. | [optional] 
**description** | **String** | Es la descripción de la operación. | [optional] 
**iva** | **Float** | Es el Impuesto al Valor Agregado (IVA) de la operación. | [optional] 
**operation_date** | **DateTime** | Es la fecha en la que se realizó la operación. | [optional] 
**operation_date_cep** | **DateTime** | Es la fecha en la que se genera el CEP. | [optional] 
**reference** | **String** | Es la Referencia de la operación | [optional] 
**sender_name** | **String** | Es el nombre de quién envía la operación. | [optional] 
**sender_rfc** | **String** | Es el Registro Federal de Contrinuyentes (RFC) de quién envía la operación. | [optional] 
**signature** | **String** | Firma del CEP | [optional] 
**url_zip** | **String** | Dirección URL de descarga del archivo ZIP que contiene el PDF y XML del CEP proporcionado por BANXICO | [optional] 


