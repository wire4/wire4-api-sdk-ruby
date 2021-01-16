# Wire4Client::AccountSpid

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount_limit** | **Float** | Monto límite permitido para la cuenta. Ejemplo: 1000.00 | 
**bank_code_banxico** | **String** | Es el código banxico con una longitud de 5 dígitos, es requerido en caso de que la cuenta del beneficiario sea un número de celular. | [optional] 
**beneficiary_account** | **String** | Cuenta del beneficiario debe ser una cuenta CLABE. Ejemplo: 032180000118359719. | 
**cancel_return_url** | **String** | Es la dirección URL a la que se redirigirá en caso de que el cliente cancele el registro. Se valida hasta 512 caracteres. | [optional] 
**email** | **Array&lt;String&gt;** | Lista de correos electrónicos (emails), este dato es opcional. | [optional] 
**institution** | [**BeneficiaryInstitution**](BeneficiaryInstitution.md) | Objeto que contiene el nombre de la institución, es mutuamente exclusivo con el objeto Person | 
**kind_of_relationship** | **String** | Es el tipo de relación que se tiene con el propietario de la cuenta. Para registrar una cuenta, este valor se debe obtener del recurso &lt;a href&#x3D;\&quot;#operation/getAvailableRelationshipsMonexUsingGET\&quot;&gt; relationships.&lt;/a&gt; &lt;br /&gt;&lt;br /&gt;&lt;b&gt;Nota:&lt;/b&gt; &lt;em&gt;Si en la respuesta de Monex esta propiedad es nula, tampoco estará presente en esta respuesta.&lt;/em&gt; | 
**numeric_reference** | **String** | Es la referencia numérica. | [optional] 
**payment_concept** | **String** | Es el concepto de pago. | [optional] 
**relationship** | **String** | Es la relación con el propietario de la cuenta, para registrar este valor se debe obtener del recurso &lt;a href&#x3D;\&quot;#operation/getAvailableRelationshipsMonexUsingGET\&quot;&gt;relationships.&lt;/a&gt; &lt;br/&gt; &lt;br/&gt; &lt;b&gt;Nota:&lt;/b&gt; Si en la respuesta de Monex, sta propiedad es nula, tampoco estará presente en esta respuesta. | 
**return_url** | **String** | Es la dirección URL a la que se redirigirá en caso exitoso. Se valida hasta 512 caracteres. | [optional] 
**rfc** | **String** | Es el Registro federal de contribuyentes (RFC) de la persona o institución propietaria de la cuenta. &lt;br/&gt; &lt;br/&gt;&lt;b&gt;Nota:&lt;/b&gt; Se valida el formato de RFC. | [optional] 


