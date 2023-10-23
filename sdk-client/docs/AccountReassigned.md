# Wire4Client::AccountReassigned

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount_limit** | **Float** | Es el monto límite permitido que se registra para la cuenta. Por ejemplo 1000.00. | 
**authorization_date** | **DateTime** | Es la fecha en la que se autorizó el registro del beneficiario. Ésta fecha viene en formato ISO 8601 con zona horaria, ejemplo: &lt;strong&gt;2020-10-27T11:03:15.000-06:00&lt;/strong&gt;. | [optional] 
**bank** | [**Institution**](Institution.md) | Es el banco al cuál pertenece la cuenta. | [optional] 
**beneficiary_account** | **String** | Es la cuenta del beneficiario, podría ser teléfono celular (se valida que sea de 10 dígitos), Tarjeta de débito (TDD, se valida que sea de 16 dígitos) o cuenta CLABE (se valida que sea de 18 dígitos). &lt;br/&gt;&lt;br/&gt;Por ejemplo Teléfono celular: 5525072600, TDD: 4323 1234 5678 9123, CLABE: 032180000118359719. | 
**email** | **Array&lt;String&gt;** | Es una lista de correos electrónicos (emails). Se valida el formato de email. Este campo es opcional. | [optional] 
**institution** | [**BeneficiaryInstitution**](BeneficiaryInstitution.md) | Es el objeto que contiene el nombre de la institución, es mutuamente exclusivo con el objeto Person. | [optional] 
**kind_of_relationship** | **String** | Es el tipo de relación que se tiene con el propietario de la cuenta. Para registrar una cuenta, este valor se debe obtener del recurso &lt;a href&#x3D;\&quot;#operation/getAvailableRelationshipsMonexUsingGET\&quot;&gt;relationships.&lt;/a&gt; &lt;br /&gt;&lt;br /&gt;&lt;b&gt;Nota:&lt;/b&gt; &lt;em&gt;Si en la respuesta de Monex esta propiedad es nula, tampoco estará presente en esta respuesta.&lt;/em&gt; | 
**numeric_reference_spei** | **String** | Es la referencia numérica a utilizar cuando se realice una transferencia y no se especifique una referencia. | [optional] 
**payment_concept_spei** | **String** | Es el concepto de pago a utilizar cuando se realice una transferencia y no se especifique un concepto | [optional] 
**person** | [**Person**](Person.md) | Es el objeto que contiene los datos de la persona propietaria de la cuenta. &lt;br /&gt; &lt;br /&gt;&lt;b&gt;Nota: &lt;/b&gt; si se incluye este atributo, entonces el objeto &lt;b&gt;\&quot;institution\&quot;&lt;/b&gt; no debe estar presente. | [optional] 
**register_date** | **DateTime** | Es la fecha en la que se registró el beneficiario. Ésta fecha viene en formato ISO 8601 con zona horaria, ejemplo: &lt;strong&gt;2020-10-27T11:03:15.000-06:00&lt;/strong&gt;. | [optional] 
**relationship** | **String** | Es la relación con el propietario de la cuenta, para registrar este valor se debe obtener del recurso &lt;a href&#x3D;\&quot;#operation/getAvailableRelationshipsMonexUsingGET\&quot;&gt;relationships.&lt;/a&gt; &lt;br/&gt; &lt;br/&gt; &lt;b&gt;Nota:&lt;/b&gt; Si en la respuesta de Monex, sta propiedad es nula, tampoco estará presente en esta respuesta. | 
**rfc** | **String** | Es el Registro Federal de Contribuyentes (RFC) de la persona o institución propietaria dela cuenta. &lt;br/&gt; &lt;br/&gt;&lt;b&gt;Nota:&lt;/b&gt; Si en la respuesta de Monex esta propiedad es nula, tampoco estará presente en esta respuesta. | 
**status** | **String** | Es el estado en el que se encuentra el registo del beneficiario.&lt;br&gt;Los valores pueden ser:&lt;ul style&#x3D;\&quot;font-size: 12px; font-weight: 600;\&quot;&gt;&lt;li&gt;RECEIVED&lt;/li&gt;&lt;li&gt;DELETED&lt;/li&gt;&lt;li&gt;REQUEST_ERROR_BY_MONEX&lt;/li&gt;&lt;li&gt;REQUESTED_TO_MONEX&lt;/li&gt;&lt;li&gt;NOTIFIED_BY_MONEX&lt;/li&gt;&lt;li&gt;NOTIFIED_BY_SPEIOK&lt;li&gt;&lt;/li&gt;NOTIFIED_WITH_ERROR_BY_SPEIOK&lt;/li&gt;&lt;li&gt;PENDING&lt;/li&gt;&lt;/ul&gt; | [optional] 


