# Wire4Client::AccountResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount_limit** | **Float** | Monto límite permitido registrado para la cuenta | 
**bank** | [**Institution**](Institution.md) | El banco al cual pertenece la cuenta | [optional] 
**beneficiary_account** | **String** | Cuenta del beneficiario, podría ser teléfono celular, TDD o cuenta CLABE | 
**email** | **Array&lt;String&gt;** | Lista de email&#39;s, este dato es opcional | [optional] 
**institution** | [**BeneficiaryInstitution**](BeneficiaryInstitution.md) | Objeto que contiene el nombre de la institución, es mutuamente exclusivo con el objeto Person | [optional] 
**kind_of_relationship** | **String** | Tipo de relación con el propietario de la cuenta, para registrar una cuenta este valor se debe obtener  del recurso relationships. &lt;br&gt; Nota: Si en la respuesta de Monex esta propiedad es nula, tampoco estará presente en esta respuesta. | 
**numeric_reference_spei** | **String** | Referencia numérica a utilizar cuando se realice una transferencia y no se especifique una referencia | [optional] 
**payment_concept_spei** | **String** | Concepto de pago a utilizar cuando se realice una transferencia y no se especifique un concepto | [optional] 
**person** | [**Person**](Person.md) | Objeto que contiene los datos de la persona propietaria de la cuenta, si se incluye este atributo, el atributo institution no debe estar presente | [optional] 
**register_date** | **DateTime** | La fecha en la que se registro el beneficiario | [optional] 
**relationship** | **String** | Relación con el propietario de la cuenta, para registrar una cuenta este valor se debe obtener  del recurso relationships. &lt;br&gt; Nota: Si en la respuesta de Monex esta propiedad es nula, tampoco estará presente en esta respuesta. | 
**rfc** | **String** | Registro federal de contribuyentes de la persona o institución propietaria de la cuenta. &lt;br&gt; Nota: Si en la respuesta de Monex esta propiedad es nula, tampoco estará presente en esta respuesta. | 
**status** | **String** | El estado (status) en el que se encuentra el registro del beneficiario | [optional] 


