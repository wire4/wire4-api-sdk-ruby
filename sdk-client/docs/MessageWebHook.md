# Wire4Client::MessageWebHook

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**api_version** | **String** | La versión de la API | [optional] 
**created** | **DateTime** | Fecha de creación del mensaje | [optional] 
**data** | **Object** | Objeto que contiene la información del evento | [optional] 
**id** | **String** | El identificador del mensaje | [optional] 
**livemode** | **BOOLEAN** | Indica si proviene de un entorno productivo | [optional] 
**object** | **String** | Tipo de objeto  que contiene el mensaje en el atributo data los posibles valores son: subscription, beneficiary, spei_outgoing, spei_incoming, spid_outgoing  | [optional] 
**pending_webhooks** | **Integer** | Número de  mensajes pendientes de enviar | [optional] 
**request** | **String** | Identificador del recurso relacionado | [optional] 
**type** | **String** | El tipo evento que se esta enviando en la notifiación | [optional] 


