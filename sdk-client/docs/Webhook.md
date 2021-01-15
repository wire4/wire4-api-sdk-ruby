# Wire4Client::Webhook

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**events** | **Array&lt;String&gt;** | Tipo de evento manejado por el webhook. Para más referencia sobre los tipos de eventos soportados, revise la siguiente liga: &lt;a href&#x3D;\&quot;#section/Eventos\&quot;&gt;https://developers.wire4.mx/#section/Eventos.&lt;/a&gt; | [optional] 
**name** | **String** | Es el nombre del webhook. | [optional] 
**secret** | **String** | Es la llave con la que se debe de identificar que el webhook fue enviado por Wire4. Para mayor información revisar la guía de notificaciones en la sección de &lt;a href&#x3D;\&quot;https://wire4.mx/#/guides/notificaciones\&quot;&gt;\&quot;Comprobación de firmas de Webhook\&quot;.&lt;/a&gt; | [optional] 
**status** | **String** | Estado (estatus) en el que se encuentra el webhook. | [optional] 
**url** | **String** | Es la dirección URL a la que Wire4 enviará las notificaciones cuando un evento ocurra. | [optional] 
**wh_id** | **String** | Es el identificador del webhook. | [optional] 


