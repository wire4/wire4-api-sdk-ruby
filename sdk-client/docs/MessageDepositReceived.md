# Wire4Client::MessageDepositReceived

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | Es el monto de la transferencia. | [optional] 
**beneficiary_account** | **String** | Es la cuenta del beneficiario. | [optional] 
**beneficiary_name** | **String** | Es el nombre del beneficiario. | [optional] 
**beneficiary_rfc** | **String** | Es el Registro Federal de Contribuyentes (RFC) del beneficiario. | [optional] 
**cep** | [**MessageCEP**](MessageCEP.md) | Es el objeto que contiene la informacion del CEP. | [optional] 
**clave_rastreo** | **String** | Es la clave de rastreo de la transferencia. | [optional] 
**confirm_date** | **DateTime** | Es la Fecha de confirmación de la transferencia. | [optional] 
**currency_code** | **String** | Es el código de divisa de la transferencia. Es en el formato estándar ISO 4217 y es de 3 dígitos. Puede ser \&quot;MXN\&quot; o \&quot;USD\&quot;. | [optional] 
**deposit_date** | **DateTime** | Es la fecha de recepción de la transferencia. | [optional] 
**depositant** | **String** | Es el nombre del depositante en caso de que la transferencia se reciba en una cuenta de depositante. | [optional] 
**depositant_alias** | **String** | Es el alias de la cuenta CLABE del depositante en caso que la transferencia se reciba de una cuenta de depositante | [optional] 
**depositant_clabe** | **String** | Es la cuenta CLABE del depositante en caso que la transferencia se reciba en una cuenta de depositante | [optional] 
**depositant_email** | **String** | Es el Correo electrónico (email) del depositante en caso que la transferencia se reciba en una cuenta de depositante | [optional] 
**depositant_rfc** | **String** | Es el Registro Federal de Contribuyentes (RFC) del depositante, en caso que la transferencia se reciba en una cuenta de depositante. | [optional] 
**description** | **String** | Es el concepto de la transferencia. | [optional] 
**monex_description** | **String** | Es la descripción de Monex para la transferencia. | [optional] 
**monex_transaction_id** | **String** | Es el identificador asignado por Monex a la transferencia. | [optional] 
**order_id** | **String** | Número de orden asignado por el cliente de Wire4 | [optional] 
**reference** | **String** | Es la referecia de la transferencia. | [optional] 
**request_id** | **String** | Es el identificador de la solicitud de cobro establecido por la aplicación. | [optional] 
**return_id_instruction** | **Integer** | Es el id de devolucion de la transaccion. | [optional] 
**sender_account** | **String** | Es la cuenta del ordenante que podría ser un número celular (10 dígitos), una tarjeta de débito (TDD, de 16 dígitos) o Cuenta CLABE interbancaria (18 dígitos). | [optional] 
**sender_bank** | [**MessageInstitution**](MessageInstitution.md) | Es el objeto con información del banco del ordenante. | [optional] 
**sender_name** | **String** | Es el nombre del ordenante. | [optional] 
**sender_rfc** | **String** | Es el Registro Federal de Contribuyente (RFC) del ordenante. | [optional] 


