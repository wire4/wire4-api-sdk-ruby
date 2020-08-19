# Wire4Client::SpidBeneficiaryResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount_limit** | **Float** | Monto límite permitido para la cuenta | 
**bank** | [**Institution**](Institution.md) | El banco al cual pertenece la cuenta | [optional] 
**beneficiary_account** | **String** | Cuenta del beneficiario debe ser una cuenta CLABE | 
**email** | **Array&lt;String&gt;** | Lista de email&#39;s, este dato es opcional | [optional] 
**institution** | [**BeneficiaryInstitution**](BeneficiaryInstitution.md) | Objeto que contiene el nombre de la institución, es mutuamente exclusivo con el objeto Person | 
**kind_of_relationship** | **String** | Tipo de relación de la cuenta, este valor debe ser igual a uno de los obtenidos del recurso de consulta de relationships | 
**numeric_reference_spid** | **String** | Referencia numérica | [optional] 
**payment_concept_spid** | **String** | Concepto de pago | [optional] 
**register_date** | **DateTime** | La fecha en la que se registro el beneficiario | [optional] 
**relationship** | **String** | Código de relación de la cuenta, este valor debe ser igual a uno de los obtenidos del recurso de consulta de  relationship | 
**rfc** | **String** | Registro federal de contribuyentes | [optional] 
**status** | **String** | El estado en el que se encuentra el registo del beneficiario | [optional] 


