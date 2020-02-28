# Wire4Client::BeneficiariesQueryRegisterStatus

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**authorization_date** | **DateTime** | Fecha en que el usuario propietario del token autorizo el registro de beneficiarios | [optional] 
**beneficiaries** | [**Array&lt;AccountResponse&gt;**](AccountResponse.md) | Lista de beneficiarios obtenidos | [optional] 
**request_date** | **DateTime** | Fecha en que se realizó la petición de registro de beneficiarios | [optional] 
**request_id** | **String** | Identificador de la petición del registro de beneficiarios | [optional] 
**status_request** | **String** | Indica sí la petición ya fue autorizada usando el token del usuario | [optional] 
**total_beneficiaries** | **Integer** | Total de beneficiarios enviados en la petición | [optional] 


