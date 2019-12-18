# Wire4Client::AccountSpid

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount_limit** | **Float** | Monto límite permitido para la cuenta | 
**bank_code_banxico** | **String** | Código banxico con una longitud de 5 dígitos, es requerido en caso de que la cuenta del beneficiario sea un número de celular | [optional] 
**beneficiary_account** | **String** | Cuenta del beneficiario debe ser una cuenta CLABE | 
**cancel_return_url** | **String** | Url a la que se redirigira en caso no exitoso | [optional] 
**email** | **Array&lt;String&gt;** | Lista de email&#39;s, este dato es opcional | [optional] 
**institution** | [**BeneficiaryInstitution**](BeneficiaryInstitution.md) | Objeto que contiene el nombre de la institución, es mutuamente exclusivo con el objeto Person | 
**kind_of_relationship** | **String** | Tipo de relación de la cuentaobtained of endpoint relationships | 
**numeric_reference** | **String** | Referencia numérica | [optional] 
**payment_concept** | **String** | Concepto de pago | [optional] 
**relationship** | **String** | Código de relación de la cuenta, este valor debe ser igual a un valor obtenido del endpoint relationship | 
**return_url** | **String** | Url a la que se redireccionara en caso exitoso | [optional] 
**rfc** | **String** | Registro federal de contribuyentes | [optional] 


