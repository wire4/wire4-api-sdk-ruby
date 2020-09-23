# Wire4Client::PaymentRequestCodiResponseDTO

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount** | **Float** | Monto del pago. | [optional] 
**barcode_base64** | **String** | Imagen QR en formato Base64 para el CODI®. | [optional] 
**barcode_url** | **String** | URL de la imagen QR para el CODI®. | [optional] 
**concept** | **String** | Concepto de pago. | [optional] 
**creation_date** | **DateTime** | Fecha de creación. | [optional] 
**due_date** | **DateTime** | Fecha de vencimiento. | [optional] 
**operations** | [**Array&lt;CodiOperationResponseDTO&gt;**](CodiOperationResponseDTO.md) | Listado de pagos realizados sobre la petición. | [optional] 
**order_id** | **String** | OrderId asignada a la solicitud. | [optional] 
**phone_number** | **String** | Numero de teléfono. | [optional] 
**status** | **String** | Estatus de la orden de pago. | [optional] 
**type** | **String** | Tipo de petición. | [optional] 


