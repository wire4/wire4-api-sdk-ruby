=begin
#Wire4RestAPI

# # Referencia de API La API de Wire4 está organizada en torno a REST. Nuestra API tiene URLs predecibles orientadas a los recursos, acepta peticiones en formato JSON, y las respuestas devueltas son formato JSON y utiliza códigos de respuesta HTTP, autenticación y verbos estándares.  Puede usar la API de Wire4 en nuestro entorno de prueba, que no afecta sus productivos ni interactúa con la red bancaria. La URL de conexión que se usa para invocar los servicios determina si la solicitud es en modo en de prueba o en modo producción.    # Autenticación La API de Wire4 utiliza el protocolo OAuth 2.0 para autenticación y autorización.   Para comenzar, es necesario que registre una cuenta en nuestro ambiente de pruebas en [registro](https://app-sndbx.wire4.mx/#/register) y obtenga las credenciales de cliente OAuth 2.0 desde la [consola de administración](https://app-sndbx.wire4.mx/#/dashboard/api-keys).   Esta página ofrece una descripción general de los escenarios de autorización de OAuth 2.0 que admite Wire4.   Después de crear su aplicación con Wire4, asegúrese de tener a la mano su `client_id` y `client_secret`. El siguiente paso es descubrir qué flujo de OAuth2 es el adecuado para sus propósitos.   ## URLS La siguiente tabla muestra las urls de los recursos de autenticación para el ambiente de pruebas.  URL                  | Descripción ------------------------------------ | ------------- https://sandbox-api.wire4.mx/token   | Obtener token de autorización llaves de API (*client_id*, *client_secret*), datos de suscripción (*client_id*, *client_secret*, *user_key*, *user_secret*) o (*refresh_token*) https://sandbox-api.wire4.mx/revoke  | Revocación de token  **Nota:** De acuerdo con el RFC 6749, la URL del token sólo acepta el tipo de contenido x-www-form-urlencoded. El contenido JSON no está permitido y devolverá un error.  ## Scopes Los `scopes` limitan el acceso de una aplicación a los recursos de Wire4. Se ofrecen los siguientes scopes de acuerdo al producto:  Producto                             |Scope                      | Descripción -------------------------------------|------------------------------------ | ------------- SPEI-SPID                            |general                              | Permite llamar a operaciones que no requieren a un cliente Monex suscrito en Wire4, los recursos que se pueden consumir con este scope son: consulta de Instituciones, CEP y generación de una presuscripción. SPEI-SPID                            |spei_admin                           | Permite llamar a operaciones que requieren de un cliente Monex suscrito en Wire4, ya que se proporciona información de saldos, administración de transacciones, cuentas de beneficiarios y cuentas de depositantes. SPEI-SPID                            |spid_admin                           | Permite llamar sólo a operaciones SPID, se requiere de un cliente Monex suscrito en Wire4. CODI                                 |codi_general                         | Permite llamar a operaciones de administración sobre el producto CoDi, como creación y listado de empresas  CODI                                 |codi_admin                           | Permite llamar sólo a operaciones CoDi dentro de un punto de venta, las operaciones incluyen creación, consulta, listado, etc de peticiones de pago CODI                                 |codi_report                          | Permite generar reportes de operaciones CoDi. TODOS                                |device_[dispositivo]                 | Se debe especificar cuándo se gestionan token's desde distintos dispositivos.  ## Tipos de autenticación   Wire4 cuenta con dos tipos de autenticación: Autenticación de Aplicación (OAuth 2.0  Client Credentials Grant)  y Autenticación de Usuario de Aplicación (OAuth 2.0 Password Grant).  ### Autenticación de Aplicación  Esta autenticación se obtiene proporcionando únicamente las llaves de API las cuáles se pueden consultar en [Llaves de API](https://app-sndbx.wire4.mx/#/dashboard/api-keys) de la consola de administración.  La autenticación de aplicación permite accesso a recursos generales y de administración que dependeran del scope.  Para este tipo de autenticación se sigue el flujo OAuth 2.0 Client Credentials Grant, que se describe más adelante en **Obtener el token de acceso de aplicación**, algunos de los recursos que requieren este tipo de autenticación son:   * [/subscriptions/pre-subscription](link) * [/institutions](link>) * [/ceps](<link>) * [/codi/compaies](<link>)  ### Autenticación de Usuario de Aplicación  Esta autenticación se obtiene proporcionando las llaves de API las cuáles se pueden consultar en [Llaves de API](https://app-sndbx.wire4.mx/#/dashboard/api-keys) más el ***user_key*** y ***user_secret*** que se proporcionan al momento de crear una suscripción o un punto de venta, para más información puedes consultar las guías [creación de suscripción](https://www.wire4.mx/#/guides/subscriptions), [creación de punto de venta](https://www.wire4.mx/#/guides/salespoint).  Con este tipo de autenticación se puede acceder a los recursos especificos que requieren configuraciones y acceso más puntual como información de una cuentas, saldos y administración de transacciones SPEID-SPID o CODI.    ## Obtener token de acceso Antes de que su aplicación pueda acceder a los datos mediante la API de Wire4, debe obtener un token de acceso ***(access_token)*** que le otorgue acceso a la API. En las siguientes secciones se muestra como obtener un token para cada una de las autenticaciones.     ### Obtener el token de acceso para autenticación de aplicación  El primer paso es crear la solicitud de token de acceso (*access_token*), con los parámetros que identifican su aplicación, el siguiente código muestra cómo obtener un `token`.  ``` curl -k -d \"grant_type= client_credentials&scope=general\"  -u \"<client id>:<client secret>\" https://sandbox-api.wire4.mx/token ``` **Ejemplo:**   ``` curl -k -d \"grant_type=client_credentials&scope=general\"  -u \"8e59YqaFW_Yo5dwWNxEY8Lid0u0a:AXahn79hfKWBXKzQfj011x8cvcQa\"  https://sandbox-api.wire4.mx /token ``` Obtendrá una respuesta como la que se muestra a continuación, donde se debe obtener el *access_token* para realizar llamadas posteriores a la API.   ``` {     \"access_token\":\"eyJ4NXQiOiJZak5sWVdWa05tWmlNR1ZoTldSaU1EUXpaREJpWlRJNU1qYzFZV1ZoWWpneU5UYzJPV05sWVEiLCJraWQiOiJZak5sWVdWa05tWmlNR1ZoTldSaU1EUXpaREJpWlRJNU1qYzFZV1ZoWWpneU5UYzJPV05sWVEiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJpc21hZWwuZXNjYW1pbGxhQHRjcGlwLnRlY2hAc2FuZGJveC5zcGVpb2suY29tIiwiYXVkIjoiOGU1OVlxYUZXX1lvNWR3V054RVk4TGlkMHUwYSIsIm5iZiI6MTU3MTMyMDg3NywiYXpwIjoiOGU1OVlxYUZXX1lvNWR3V054RVk4TGlkMHUwYSIsInNjb3BlIjoiYW1fYXBwbGljYXRpb25fc2NvcGUgZ2VuZXJhbCIsImlzcyI6ImFwaW0taWRwIiwiZXhwIjoxNTcxMzI0NDc3LCJpYXQiOjE1NzEzMjA4NzcsImp0aSI6ImJkMTdjMjcyLTg4MGQtNDk0ZS1iMTMwLTBiYTkwMjYyN2M4NCJ9.AjngGylkd_Chs5zlIjyLRPu9xPGyz4dfCd_aax2_ts653xrnNMoLpVHUDmaxIDFF2XyBJKH2IAbKxjo6VsFM07QkoPhlysO1PLoAF-Vkt4xYkh-f7nJRl0oOe2utDWFlUdgiAOmx5tPcStrdCEftgNNrjwJ50LXysFjXVshpoST-zIJPLgXknM3esGrkAsLcZRM7XUB187jxLHbtefVYPMvSO31T9pd5_Co9UXdeHpuA98sk_wZknASM1phxXQZAMLRLHz3LYvjCWCr_v80oVCM9SWTzf0vrMI6xphoIfirfWloADKPTTSUpIGBw9ePF_WbEPvbMm_BZaApJcEH2w\",    \"scope\":\"am_application_scope general\",    \"token_type\":\"Bearer\",    \"expires_in\":3600 }  ```  Es posible generar tokens con más de un scope, en caso que sea necesario utilizar dicho token para hacer más de una operación. Para generarlo basta con agregarlo a la petición separado por un espacio.     ``` curl -k -d \"grant_type=client_credentials&scope=codi_general codi_report\"  -u \"8e59YqaFW_Yo5dwWNxEY8Lid0u0a:AXahn79hfKWBXKzQfj011x8cvcQa\"  https://sandbox-api.wire4.mx /token ```  ### Obtener el token de acceso para autenticación usuario de aplicación   Antes de que su aplicación pueda acceder a los datos de una cuenta Monex mediante la API de Wire4, debe obtener un token de acceso  (*access_token*) que le otorgue acceso a la API y contar con el  *user_key* y *user_secret* que se proporcionan al momento de crear  una suscripción para más información puedes consultar [creación de suscripción](https://wire4.mx/#/guides/subscriptions) .   El primer paso es crear la solicitud de token de acceso con los parámetros que identifican su aplicación y la suscripción y con `scope` `spei_admin`  ```   curl -k -d \"grant_type=password&scope=spei_admin&username=<user_key>&password=<user_secret>\"  -u \"<client_id>:<client_secret>\" https://sandbox-api.wire4.mx/token ``` **Ejemplo**  ``` curl -k -d \"grant_type=password&scope=spei_admin&username=6 nbC5e99tTO@sandbox.wire4com&password= Nz7IqJGe9h\" -u \" zgMlQbqmOr:plkMJoPXCI\" https://sandbox-api.wire4.mx /token  ```  ``` {     \"access_token\":\"eyJ4NXQiOiJPR1EyTURFM00yTmpObVZoTnpFeE5EWXlObUV4TURKa01qUTJaVEU0TWpGaE1tVmlZakV5TkEiLCJraWQiOiJPR1EyTURFM00yTmpObVZoTnpFeE5EWXlObUV4TURKa01qUTJaVEU0TWpGaE1tVmlZakV5TkEiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzMzE0ODRlZTdjZDRkYWU5MzRmMjY2Zjc5YmY1YWFAZGV2LWllc2NhbWlsbGEuc3BlaW9rLmNvbSIsImF1ZCI6IkJVR0xjNWw1bW5CZXlPeGxtamNUZ0JoS19WTWEiLCJuYmYiOjE1NzEzNDk4ODMsImF6cCI6IkJVR0xjNWw1bW5CZXlPeGxtamNUZ0JoS19WTWEiLCJzY29wZSI6InNwZWlfYWRtaW4iLCJpc3MiOiJhcGltLWlkcCIsImV4cCI6MTU3MTM1MzQ4MywiaWF0IjoxNTcxMzQ5ODgzLCJqdGkiOiJiOWQ1M2Q0MC0xN2MwLTQxOTItYjUwNy0wZWFhN2ZkNDA1MGYifQ.hLTk8AFoIce1GpLcgch-U5aLLgiiFTo49wfBErD8D6VF-H9sG13ZyfAx9T-vQkk2m1zPapYVQjwibz3GRAJMN0Vczs6flV1mUJwFDQbEE-AELPdRcaRFOMBCfF6H9TVLfhFsGb9U2pVR9TLJcKqR57DyO_dIcc9I6d0tIkxqn2VcqypLVi5YQf36WzBbPeG-iPHYpMA-bhr4rwfjKA-O6jm1NSSxNHF4sHS0YHDPoO_x6cCc677MQEe0_CozfnQhoEWNfG8tcWUqhPtmcfjqon1p7PdQoXxriq_R85d06pVO9Se7Q6ok0V8Qgz0MOJ6z3ku6mtZSuba7niMAOt2TyA\",    \"refresh_token\":\"f962d5c6-0d99-3809-8275-11c7aa0aa020\",    \"scope\":\"spei_admin\",    \"token_type\":\"Bearer\",    \"expires_in\":3600 } ```  **Suscripciones in activas**   En caso de intentar obtener el token de acceso para una suscriptión que no esta activa obtendra una respuesta de error con código 400 ``` curl -k -d \"grant_type=password&scope=spei_admin&username=6 nbC5e99tTO@sandbox.wire4com&password= Nz7IqJGe9h\" -u \" zgMlQbqmOr:plkMJoPXCI\" https://sandbox-api.wire4.mx /token  ``` ``` {     \"error_description\": \"Error while authenticating user from user store\",     \"error\": \"invalid_grant\" } ```    Una vez que la suscripción se reactive podrá generar el token de acceso de forma normal.    **Nota:** Los ejemplos anteriores se presentan considerando que se realiza una implementación desde cero,  esto se puede simplificar a sólo configurar sus llaves (*client_id*, *client_secret*),  datos de suscripción (*client_id*, *client_secret*, *user_key*, *user_secret*) si utiliza nuestros sdks.      **Consideraci&oacute;n:** Si la aplicaci&oacute;n en la que implementar&aacute; Wire4 estar&aacute; desplegada en más de una instancia o servidor en cada solicitud de token debe especificar un scope adicional. La forma de hacer esto es que, cuándo se solicita un token se debe especificar un scope adicional con el prefijo \"device_\" +  el dispositivo, por ejemplo:                                                                                                                                                                                                                     device_server1<br> device_server2  en consecuencia cada instancia debe operar con el token gestionado. ***Si se opera con el mismo token en instancias diferentes encontrará problemas de Credenciales Inv&aacute;lidas.***  **Ejemplo de solicitud de token para instancias diferentes:**  ``` curl -k -d \"grant_type=password&username=0883b97333046abb76367698b57d9e@sandbox.wire4.mx&password=9e0d81f95705079b9fe1e129315c25&scope=device_server1 codi_admin\" -H \"Authorization: Basic dmZSeURpTHdFbVZqd2VIclp0OWRMbXFmb3YwYTpJQJBuamBac3V6SllLWlJHUkJEYUZrN1BhRmNh\" https://sandbox-api.wire4.mx/token  curl -k -d \"grant_type=password&username=0883b97333046abb76367698b57d9e@sandbox.wire4.mx&password=9e0d81f95705079b9fe1e129315c25&scope=device_server2 codi_admin\" -H \"Authorization: Basic dmZSeURpTHdFbVZqd2VIclp0OWRMbXFmb3YwYTpJQJBuamBac3V6SllLWlJHUkJEYUZrN1BhRmNh\" https://sandbox-api.wire4.mx/token ```  ## Caducidad del token El token de acceso es válido durante 60 minutos (una hora), después de transcurrido este tiempo se debe solicitar un nuevo token,  cuando el token caduca se obtendrá un error ***401 Unauthorized*** con mensaje ***“Invalid Credentials”.***   El nuevo token se puede solicitar  utilizando el último token de actualización (***refresh_token***) que se devolvió en la solicitud del token,   esto sólo aplica para el token de tipo password (Autenticación de Usuario de Aplicación). El siguiente ejemplo muestra cómo obtener un toke con el token de actualización.  ``` curl -k -d \"grant_type=refresh_token&refresh_token=<refresh_token>\" -u \" Client_Id:Client_Secret\" -H \"Content-Type: application/x-www-form-urlencoded\" https://sandbox-api.wire4.mx/oauth2/token ```  **Ejemplo:**  ``` curl -k -d \"grant_type=refresh_token&refresh_token=f932d5c6-0d39-3809-8275-11c7ax0aa020\" -u \"zgMlQbqmOr:plkMJoPXCI\" -H \"Content-Type: application/x-www-form-urlencoded\" https://sandbox-api.wire4.mx/token ```  El token de actualización (***refresh_token***) tiene una duración de hasta 23 horas. Si en este periodo no se utiliza, se tienen que solicitar un nuevo token.  Un token de acceso podría dejar de funcionar por uno de estos motivos:  * El usuario ha revocado el acceso a su aplicación, si un usuario ha solicitado la baja de su aplicación de WIre4. * El token de acceso ha caducado: si el token de acceso ha pasado de una hora, recibirá un error ***401 Unauthorized*** mientras realiza una llamada a la API de Wire4. Cuando esto sucede, debe solicitar un nuevo token utilizando el token de actualización que recibió por última al solicitar un token, sólo aplica si el token en cuestión es de autenticación de usuario de aplicación, en caso contrario solicitar un nuevo token.   ## Revocar token Su aplicación puede revocar mediante programación el token de acceso, una vez revocado el token no podrá hacer uso de él para acceder a la API. El siguiente código muestra un ejemplo de cómo revocar el token:    ```  curl -X POST --basic -u \"<client id>:<client secret>\" -H \"Content-Type: application/x-www-form-urlencoded;charset=UTF-8\" -k -d \"token=<token to revoke>&token_type_hint=access_token\" https://sandbox-api.wire4.mx/revoke ```      **Ejemplo:**  ```   curl -X POST --basic -u \"8e59YqaFW_Yo5dwWNxEY8Lid0u0a:AXahn79hfKWBXKzQfj011x8cvcQa\" -H \"Content-Type: application/x-www-form-urlencoded;charset=UTF-8\" -k -d \"token=eyJ4NXQiOiJZak5sWVdWa05tWmlNR1ZoTldSaU1EUXpaREJpWlRJNU1qYzFZV1ZoWWpneU5UYzJPV05sWVEiLCJraWQiOiJZak5sWVdWa05tWmlNR1ZoTldSaU1EUXpaREJpWlRJNU1qYzFZV1ZoWWpneU5UYzJPV05sWVEiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJpc21hZWwuZXNjYW1pbGxhQHRjcGlwLnRlY2hAc2FuZGJveC5zcGVpb2suY29tIiwiYXVkIjoiOGU1OVlxYUZXX1lvNWR3V054RVk4TGlkMHUwYSIsIm5iZiI6MTU3MTMyMDg3NywiYXpwIjoiOGU1OVlxYUZXX1lvNWR3V054RVk4TGlkMHUwYSIsInNjb3BlIjoiYW1fYXBwbGljYXRpb25fc2NvcGUgZ2VuZXJhbCIsImlzcyI6ImFwaW0taWRwIiwiZXhwIjoxNTcxMzI0NDc3LCJpYXQiOjE1NzEzMjA4NzcsImp0aSI6ImJkMTdjMjcyLTg4MGQtNDk0ZS1iMTMwLTBiYTkwMjYyN2M4NCJ9.AjngGylkd_Chs5zlIjyLRPu9xPGyz4dfCd_aax2_ts653xrnNMoLpVHUDmaxIDFF2XyBJKH2IAbKxjo6VsFM07QkoPhlysO1PLoAF-Vkt4xYkh-f7nJRl0oOe2utDWFlUdgiAOmx5tPcStrdCEftgNNrjwJ50LXysFjXVshpoST-zIJPLgXknM3esGrkAsLcZRM7XUB187jxLHbtefVYPMvSO31T9pd5_Co9UXdeHpuA98sk_wZknASM1phxXQZAMLRLHz3LYvjCWCr_v80oVCM9SWTzf0vrMI6xphoIfirfWloADKPTTSUpIGBw9ePF_WbEPvbMm_BZaApJcEH2w&token_type_hint=access_token\"  https://sandbox-api.wire4.mx/revoke ```  # Ambientes  Wire4 cuentas con dos ambientes Pruebas (Sandbox) y Producción, son dos ambientes separados los cuáles se pueden utilizar simultáneamente. Los usuarios que han sido creados en cada uno de los ambientes no son intercambiables.   Las ligas de acceso a la `api` para cada uno de los ambientes son:  * Pruebas  https://sandbox-api.wire4.mx * Producción https://api.wire4.mx     # Eventos  Los eventos son nuestra forma de informarle cuando algo sucede en su cuenta. Cuando ocurre un evento se crea un objeto  [Evento](#tag/Webhook-Message). Por ejemplo, cuando se recibe un depósito, se crea un evento TRANSACTION.INCOMING.UPDATED.   Los eventos ocurren cuando cambia el estado de un recurso. El recurso se encuentra dentro del objeto [Evento](#tag/Webhook-Message) en el campo data.  Por ejemplo, un evento TRANSACTION.INCOMING.UPDATED contendrá un depósito y un evento ACCOUNT.CREATED contendrá una cuenta.   Wire4 puede agregar más campos en un futuro, o agregar nuevos valores a campos existentes, por lo que es recomendado que tu endpoint pueda manejar datos adicionales desconocidos. En esta [liga](#tag/Webhook-Message) se encuentra  la definición del objeto [Evento](#tag/Webhook-Message).  ## Tipos de Eventos  Wire4 cuenta con los siguientes tipos de eventos*   | Evento                               | Tipo                               | Objeto                                                  | | ------------------------------------ |----------------------------------- | ------------------------------------------------------- | | Suscripción                          | ENROLLMENT.CREATED                 | [suscription](#tag/subscription)                        | | Cuenta de beneficiario               | ACCOUNT.CREATED                    | [beneficiary](#tag/BeneficiaryAccount)                  | | Depósito recibido                    | TRANSACTION.INCOMING.UPDATED       | [spei_incoming](#tag/deposit)                           | | Solicitud de autorización de depósito| TRANSACTION.INCOMING.AUTHORIZATION | [spei_incoming_authorization](#tag/depositAuthorization)| | Transferencia realizada              | TRANSACTION.OUTGOING.RECEIVED      | [spei_outgoing](#tag/transfer)                          | | Transferencia SPID enviada           | TRANSACTION.OUTGOING.SPID.RECEIVED | [spid_outgoing](#tag/transfer)                          | | Transferencias Autorizadas           | REQUEST.OUTGOING.CHANGED           | [request_outgoing](#tag/requestOutMsg)                  | | Operación CoDi                       | CODI.ACTIONS                       | [codi_actions](#tag/codiActions)                        | | Punto de venta CoDi                  | SALE.POINT.CREATED                 | [codi_sales_point](#tag/codiSalesPoint)                 |   # Codigos de Error Al registrar transferencias tanto SPEI como SPID se aplican las validaciones de formato de datos a la petición descritas en la definición de cada recurso. Si la petición contiene errores, se genera una respuesta de error 409 que contiene el listado de las validaciones que no fueran exitosas.  Por cada error detectado se genera un elemento \"error\" que contiene el order_id de la transacción que genero el error, el código de error y un mensaje con más información sobre el mismo.  Si una misma transacción contiene varios errores, la respuesta  tendrá un elemento en la lista \"errors\" por cada validación que no fue exitosa.  Existen dos casos por los cuales alguno de los elementos en el listado de errores puede no contener order_id:  * Si alguna transacción no provee esta información  * En caso de transacciones SPEI, si el error está en las URLs ya que son datos relacionados a un lote de transacciones     **Ejemplo:**    ```   {      \"http_status\": 409,     \"message\": \"La divisa es incorrecta para esta transacción se espera: MXP, y se recibió: MXPD., El identificador 18e9c4a3-8c7a-42e8-99f4-ebi7r5r6y034 esta duplicado.\",     \"errors\": [         {             \"error\": \"La divisa es incorrecta para esta transacción se espera: MXP, y se recibió: MXPD.\",             \"code\": \"TR-1010\",             \"order_id\": \"18e9c4a3-8c7a-42e8-99f4-ebi7r5r6y034\"         },         {             \"error\": \"El identificador 18e9c4a3-8c7a-42e8-99f4-ebi7r5r6y034 esta duplicado.\",             \"code\": \"TR-1004\",             \"order_id\": \"18e9c4a3-8c7a-42e8-99f4-ebi7r5r6y034\"         }     ] }  ```      ## Códigos de error para generación de transferencias SPEI/SPID | Código                        | Descripción                                                                        | |-------------------------------|-----------------------------------------------------------------------------------| |A-1001     |La URL para éxito es requerida                                                                         | | A-1002  |La URL para retorno en caso de error es requerida                                                      | | TR-1001  |La petición debe incluir al menos una transacción                                                      | | TR-1002  |El identificador de la transacción es requerido                                                         | | TR-1003  |El identificador de la transacción no es valido                                                         | | TR-1004  |El identificador de la transacción esta duplicado                                                       | | TR-1005  |El monto de la transacción es requerido                                                                | | TR-1006  |El valor del monto no es valido                                                                        | | TR-1007  |La cuenta de beneficiario es requerida                                                                  | | TR-1008  |La cuenta de beneficiario no es valida                                                                  | | TR-1009  |El código de moneda es requerido                                                                       | | TR-1010  |El código de moneda no es valido                                                                       | | TR-1011  |El listado de email supera 10 elementos                                                                | | TR-1012  |La referencia es requerida                                                                             | | TR-1013  |La referencia no es valida                                                                             | | TR-1014  |El concepto es requerido                                                                               | | TR-1015  |El concepto no es valido                                                                               | | TR-1016  |El identificador de clasificación SPID es requerido                                                      |

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'date'

module Wire4Client
  class CepResponse
    # Es la cuenta del beneficiario.
    attr_accessor :account_beneficiary

    # Es la cuenta del ordenante.
    attr_accessor :account_sender

    # Es el monto de la transferencia.
    attr_accessor :amount

    # Indica si el CEP se encuentra disponible o no.
    attr_accessor :available

    # Es la clave del banco beneficiario el cual se puede obtener del recurso de las <a href=\"#operation/getAllInstitutionsUsingGET\">instituciones.</a>
    attr_accessor :beneficiary_bank_key

    # Nombre del beneficiario.
    attr_accessor :beneficiary_name

    # Es el Registro Federal de Contribuyentes (RFC) del beneficiario.
    attr_accessor :beneficiary_rfc

    # Cadena original del CEP.
    attr_accessor :cadena_original

    # Es la fecha de captura de la transferencia. Ésta fecha viene en formato ISO 8601 con zona horaria, ejemplo: <strong>2020-10-27T11:03:15.000-06:00</strong>.
    attr_accessor :capture_date

    # Número de serie del certificado.
    attr_accessor :certificate_serial_number

    # Es la clave de rastreo.
    attr_accessor :clave_rastreo

    # Es la descripción de la transferencia.
    attr_accessor :description

    # IVA de la transferencia.
    attr_accessor :iva

    # Es la fecha de operación de la transferencia. Ésta fecha viene en formato ISO 8601 con zona horaria, ejemplo: <strong>2020-10-27T11:03:15.000-06:00</strong>.
    attr_accessor :operation_date

    # Es la fecha de abono registrada en el CEP.  Ésta fecha viene en formato ISO 8601 con zona horaria, ejemplo: <strong>2020-10-27T11:03:15.000-06:00</strong>.
    attr_accessor :operation_date_cep

    # Es la referencia numérica de la transferencia.
    attr_accessor :reference

    # Es la clave del banco emisor el cual se puede obtener del recurso de las <a href=\"#operation/getAllInstitutionsUsingGET\">instituciones.</a>
    attr_accessor :sender_bank_key

    # Es el nombre del emisor.
    attr_accessor :sender_name

    # Es el Registro Federal de Contribuyentes (RFC) del emisor.
    attr_accessor :sender_rfc

    # Firma del CEP..
    attr_accessor :signature

    # La url al archivo zip del CEP, el cual contiene el xml y pdf
    attr_accessor :url_zip

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'account_beneficiary' => :'account_beneficiary',
        :'account_sender' => :'account_sender',
        :'amount' => :'amount',
        :'available' => :'available',
        :'beneficiary_bank_key' => :'beneficiary_bank_key',
        :'beneficiary_name' => :'beneficiary_name',
        :'beneficiary_rfc' => :'beneficiary_rfc',
        :'cadena_original' => :'cadena_original',
        :'capture_date' => :'capture_date',
        :'certificate_serial_number' => :'certificate_serial_number',
        :'clave_rastreo' => :'clave_rastreo',
        :'description' => :'description',
        :'iva' => :'iva',
        :'operation_date' => :'operation_date',
        :'operation_date_cep' => :'operation_date_cep',
        :'reference' => :'reference',
        :'sender_bank_key' => :'sender_bank_key',
        :'sender_name' => :'sender_name',
        :'sender_rfc' => :'sender_rfc',
        :'signature' => :'signature',
        :'url_zip' => :'url_zip'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'account_beneficiary' => :'String',
        :'account_sender' => :'String',
        :'amount' => :'Float',
        :'available' => :'BOOLEAN',
        :'beneficiary_bank_key' => :'String',
        :'beneficiary_name' => :'String',
        :'beneficiary_rfc' => :'String',
        :'cadena_original' => :'String',
        :'capture_date' => :'DateTime',
        :'certificate_serial_number' => :'String',
        :'clave_rastreo' => :'String',
        :'description' => :'String',
        :'iva' => :'Float',
        :'operation_date' => :'DateTime',
        :'operation_date_cep' => :'DateTime',
        :'reference' => :'String',
        :'sender_bank_key' => :'String',
        :'sender_name' => :'String',
        :'sender_rfc' => :'String',
        :'signature' => :'String',
        :'url_zip' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'account_beneficiary')
        self.account_beneficiary = attributes[:'account_beneficiary']
      end

      if attributes.has_key?(:'account_sender')
        self.account_sender = attributes[:'account_sender']
      end

      if attributes.has_key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.has_key?(:'available')
        self.available = attributes[:'available']
      end

      if attributes.has_key?(:'beneficiary_bank_key')
        self.beneficiary_bank_key = attributes[:'beneficiary_bank_key']
      end

      if attributes.has_key?(:'beneficiary_name')
        self.beneficiary_name = attributes[:'beneficiary_name']
      end

      if attributes.has_key?(:'beneficiary_rfc')
        self.beneficiary_rfc = attributes[:'beneficiary_rfc']
      end

      if attributes.has_key?(:'cadena_original')
        self.cadena_original = attributes[:'cadena_original']
      end

      if attributes.has_key?(:'capture_date')
        self.capture_date = attributes[:'capture_date']
      end

      if attributes.has_key?(:'certificate_serial_number')
        self.certificate_serial_number = attributes[:'certificate_serial_number']
      end

      if attributes.has_key?(:'clave_rastreo')
        self.clave_rastreo = attributes[:'clave_rastreo']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'iva')
        self.iva = attributes[:'iva']
      end

      if attributes.has_key?(:'operation_date')
        self.operation_date = attributes[:'operation_date']
      end

      if attributes.has_key?(:'operation_date_cep')
        self.operation_date_cep = attributes[:'operation_date_cep']
      end

      if attributes.has_key?(:'reference')
        self.reference = attributes[:'reference']
      end

      if attributes.has_key?(:'sender_bank_key')
        self.sender_bank_key = attributes[:'sender_bank_key']
      end

      if attributes.has_key?(:'sender_name')
        self.sender_name = attributes[:'sender_name']
      end

      if attributes.has_key?(:'sender_rfc')
        self.sender_rfc = attributes[:'sender_rfc']
      end

      if attributes.has_key?(:'signature')
        self.signature = attributes[:'signature']
      end

      if attributes.has_key?(:'url_zip')
        self.url_zip = attributes[:'url_zip']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          account_beneficiary == o.account_beneficiary &&
          account_sender == o.account_sender &&
          amount == o.amount &&
          available == o.available &&
          beneficiary_bank_key == o.beneficiary_bank_key &&
          beneficiary_name == o.beneficiary_name &&
          beneficiary_rfc == o.beneficiary_rfc &&
          cadena_original == o.cadena_original &&
          capture_date == o.capture_date &&
          certificate_serial_number == o.certificate_serial_number &&
          clave_rastreo == o.clave_rastreo &&
          description == o.description &&
          iva == o.iva &&
          operation_date == o.operation_date &&
          operation_date_cep == o.operation_date_cep &&
          reference == o.reference &&
          sender_bank_key == o.sender_bank_key &&
          sender_name == o.sender_name &&
          sender_rfc == o.sender_rfc &&
          signature == o.signature &&
          url_zip == o.url_zip
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [account_beneficiary, account_sender, amount, available, beneficiary_bank_key, beneficiary_name, beneficiary_rfc, cadena_original, capture_date, certificate_serial_number, clave_rastreo, description, iva, operation_date, operation_date_cep, reference, sender_bank_key, sender_name, sender_rfc, signature, url_zip].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = Wire4Client.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
