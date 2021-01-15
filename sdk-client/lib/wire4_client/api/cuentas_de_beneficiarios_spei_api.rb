=begin
#Wire4RestAPI

# # Referencia de API La API de Wire4 está organizada en torno a REST. Nuestra API tiene URLs predecibles orientadas a los recursos, acepta peticiones en formato JSON, y las respuestas devueltas son formato JSON y utiliza códigos de respuesta HTTP, autenticación y verbos estándares.  Puede usar la API de Wire4 en nuestro entorno de prueba, que no afecta sus productivos ni interactúa con la red bancaria. La URL de conexión que se usa para invocar los servicios determina si la solicitud es en modo en de prueba o en modo producción.    # Autenticación La API de Wire4 utiliza el protocolo OAuth 2.0 para autenticación y autorización.   Para comenzar, es necesario que registre una cuenta en nuestro ambiente de pruebas en [registro](https://app-sndbx.wire4.mx/#/register) y obtenga las credenciales de cliente OAuth 2.0 desde la [consola de administración](https://app-sndbx.wire4.mx/#/dashboard/api-keys).   Esta página ofrece una descripción general de los escenarios de autorización de OAuth 2.0 que admite Wire4.   Después de crear su aplicación con Wire4, asegúrese de tener a la mano su `client_id` y `client_secret`. El siguiente paso es descubrir qué flujo de OAuth2 es el adecuado para sus propósitos.   ## URLS La siguiente tabla muestra las urls de los recursos de autenticación para el ambiente de pruebas.  URL                  | Descripción ------------------------------------ | ------------- https://sandbox-api.wire4.mx/token   | Obtener token de autorización llaves de API (*client_id*, *client_secret*), datos de suscripción (*client_id*, *client_secret*, *user_key*, *user_secret*) o (*refresh_token*) https://sandbox-api.wire4.mx/revoke  | Revocación de token  **Nota:** De acuerdo con el RFC 6749, la URL del token sólo acepta el tipo de contenido x-www-form-urlencoded. El contenido JSON no está permitido y devolverá un error.  ## Scopes Los `scopes` limitan el acceso de una aplicación a los recursos de Wire4. Se ofrecen los siguientes scopes de acuerdo al producto:  Producto                             |Scope                      | Descripción -------------------------------------|------------------------------------ | ------------- SPEI-SPID                            |general                              | Permite llamar a operaciones que no requieren a un cliente Monex suscrito en Wire4, los recursos que se pueden consumir con este scope son: consulta de Instituciones, CEP y generación de una presuscripción. SPEI-SPID                            |spei_admin                           | Permite llamar a operaciones que requieren de un cliente Monex suscrito en Wire4, ya que se proporciona información de saldos, administración de transacciones, cuentas de beneficiarios y cuentas de depositantes. SPEI-SPID                            |spid_admin                           | Permite llamar sólo a operaciones SPID, se requiere de un cliente Monex suscrito en Wire4. CODI                                 |codi_general                         | Permite llamar a operaciones de administración sobre el producto CoDi, como creación y listado de empresas  CODI                                 |codi_admin                           | Permite llamar sólo a operaciones CoDi dentro de un punto de venta, las operaciones incluyen creación, consulta, listado, etc de peticiones de pago CODI                                 |codi_report                          | Permite generar reportes de operaciones CoDi. TODOS                                |device_[dispositivo]                 | Se debe especificar cuándo se gestionan token's desde distintos dispositivos.  ## Tipos de autenticación   Wire4 cuenta con dos tipos de autenticación: Autenticación de Aplicación (OAuth 2.0  Client Credentials Grant)  y Autenticación de Usuario de Aplicación (OAuth 2.0 Password Grant).  ### Autenticación de Aplicación  Esta autenticación se obtiene proporcionando únicamente las llaves de API las cuáles se pueden consultar en [Llaves de API](https://app-sndbx.wire4.mx/#/dashboard/api-keys) de la consola de administración.  La autenticación de aplicación permite accesso a recursos generales y de administración que dependeran del scope.  Para este tipo de autenticación se sigue el flujo OAuth 2.0 Client Credentials Grant, que se describe más adelante en **Obtener el token de acceso de aplicación**, algunos de los recursos que requieren este tipo de autenticación son:   * [/subscriptions/pre-subscription](link) * [/institutions](link>) * [/ceps](<link>) * [/codi/compaies](<link>)  ### Autenticación de Usuario de Aplicación  Esta autenticación se obtiene proporcionando las llaves de API las cuáles se pueden consultar en [Llaves de API](https://app-sndbx.wire4.mx/#/dashboard/api-keys) más el ***user_key*** y ***user_secret*** que se proporcionan al momento de crear una suscripción o un punto de venta, para más información puedes consultar las guías [creación de suscripción](https://www.wire4.mx/#/guides/subscriptions), [creación de punto de venta](https://www.wire4.mx/#/guides/salespoint).  Con este tipo de autenticación se puede acceder a los recursos especificos que requieren configuraciones y acceso más puntual como información de una cuentas, saldos y administración de transacciones SPEID-SPID o CODI.    ## Obtener token de acceso Antes de que su aplicación pueda acceder a los datos mediante la API de Wire4, debe obtener un token de acceso ***(access_token)*** que le otorgue acceso a la API. En las siguientes secciones se muestra como obtener un token para cada una de las autenticaciones.     ### Obtener el token de acceso para autenticación de aplicación  El primer paso es crear la solicitud de token de acceso (*access_token*), con los parámetros que identifican su aplicación, el siguiente código muestra cómo obtener un `token`.  ``` curl -k -d \"grant_type= client_credentials&scope=general\"  -u \"<client id>:<client secret>\" https://sandbox-api.wire4.mx/token ``` **Ejemplo:**   ``` curl -k -d \"grant_type=client_credentials&scope=general\"  -u \"8e59YqaFW_Yo5dwWNxEY8Lid0u0a:AXahn79hfKWBXKzQfj011x8cvcQa\"  https://sandbox-api.wire4.mx /token ``` Obtendrá una respuesta como la que se muestra a continuación, donde se debe obtener el *access_token* para realizar llamadas posteriores a la API.   ``` {     \"access_token\":\"eyJ4NXQiOiJZak5sWVdWa05tWmlNR1ZoTldSaU1EUXpaREJpWlRJNU1qYzFZV1ZoWWpneU5UYzJPV05sWVEiLCJraWQiOiJZak5sWVdWa05tWmlNR1ZoTldSaU1EUXpaREJpWlRJNU1qYzFZV1ZoWWpneU5UYzJPV05sWVEiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJpc21hZWwuZXNjYW1pbGxhQHRjcGlwLnRlY2hAc2FuZGJveC5zcGVpb2suY29tIiwiYXVkIjoiOGU1OVlxYUZXX1lvNWR3V054RVk4TGlkMHUwYSIsIm5iZiI6MTU3MTMyMDg3NywiYXpwIjoiOGU1OVlxYUZXX1lvNWR3V054RVk4TGlkMHUwYSIsInNjb3BlIjoiYW1fYXBwbGljYXRpb25fc2NvcGUgZ2VuZXJhbCIsImlzcyI6ImFwaW0taWRwIiwiZXhwIjoxNTcxMzI0NDc3LCJpYXQiOjE1NzEzMjA4NzcsImp0aSI6ImJkMTdjMjcyLTg4MGQtNDk0ZS1iMTMwLTBiYTkwMjYyN2M4NCJ9.AjngGylkd_Chs5zlIjyLRPu9xPGyz4dfCd_aax2_ts653xrnNMoLpVHUDmaxIDFF2XyBJKH2IAbKxjo6VsFM07QkoPhlysO1PLoAF-Vkt4xYkh-f7nJRl0oOe2utDWFlUdgiAOmx5tPcStrdCEftgNNrjwJ50LXysFjXVshpoST-zIJPLgXknM3esGrkAsLcZRM7XUB187jxLHbtefVYPMvSO31T9pd5_Co9UXdeHpuA98sk_wZknASM1phxXQZAMLRLHz3LYvjCWCr_v80oVCM9SWTzf0vrMI6xphoIfirfWloADKPTTSUpIGBw9ePF_WbEPvbMm_BZaApJcEH2w\",    \"scope\":\"am_application_scope general\",    \"token_type\":\"Bearer\",    \"expires_in\":3600 }  ```  Es posible generar tokens con más de un scope, en caso que sea necesario utilizar dicho token para hacer más de una operación. Para generarlo basta con agregarlo a la petición separado por un espacio.     ``` curl -k -d \"grant_type=client_credentials&scope=codi_general codi_report\"  -u \"8e59YqaFW_Yo5dwWNxEY8Lid0u0a:AXahn79hfKWBXKzQfj011x8cvcQa\"  https://sandbox-api.wire4.mx /token ```  ### Obtener el token de acceso para autenticación usuario de aplicación   Antes de que su aplicación pueda acceder a los datos de una cuenta Monex mediante la API de Wire4, debe obtener un token de acceso  (*access_token*) que le otorgue acceso a la API y contar con el  *user_key* y *user_secret* que se proporcionan al momento de crear  una suscripción para más información puedes consultar [creación de suscripción](https://wire4.mx/#/guides/subscriptions) .   El primer paso es crear la solicitud de token de acceso con los parámetros que identifican su aplicación y la suscripción y con `scope` `spei_admin`  ```   curl -k -d \"grant_type=password&scope=spei_admin&username=<user_key>&password=<user_secret>\"  -u \"<client_id>:<client_secret>\" https://sandbox-api.wire4.mx/token ``` **Ejemplo**  ``` curl -k -d \"grant_type=password&scope=spei_admin&username=6 nbC5e99tTO@sandbox.wire4com&password= Nz7IqJGe9h\" -u \" zgMlQbqmOr:plkMJoPXCI\" https://sandbox-api.wire4.mx /token  ```  ``` {     \"access_token\":\"eyJ4NXQiOiJPR1EyTURFM00yTmpObVZoTnpFeE5EWXlObUV4TURKa01qUTJaVEU0TWpGaE1tVmlZakV5TkEiLCJraWQiOiJPR1EyTURFM00yTmpObVZoTnpFeE5EWXlObUV4TURKa01qUTJaVEU0TWpGaE1tVmlZakV5TkEiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzMzE0ODRlZTdjZDRkYWU5MzRmMjY2Zjc5YmY1YWFAZGV2LWllc2NhbWlsbGEuc3BlaW9rLmNvbSIsImF1ZCI6IkJVR0xjNWw1bW5CZXlPeGxtamNUZ0JoS19WTWEiLCJuYmYiOjE1NzEzNDk4ODMsImF6cCI6IkJVR0xjNWw1bW5CZXlPeGxtamNUZ0JoS19WTWEiLCJzY29wZSI6InNwZWlfYWRtaW4iLCJpc3MiOiJhcGltLWlkcCIsImV4cCI6MTU3MTM1MzQ4MywiaWF0IjoxNTcxMzQ5ODgzLCJqdGkiOiJiOWQ1M2Q0MC0xN2MwLTQxOTItYjUwNy0wZWFhN2ZkNDA1MGYifQ.hLTk8AFoIce1GpLcgch-U5aLLgiiFTo49wfBErD8D6VF-H9sG13ZyfAx9T-vQkk2m1zPapYVQjwibz3GRAJMN0Vczs6flV1mUJwFDQbEE-AELPdRcaRFOMBCfF6H9TVLfhFsGb9U2pVR9TLJcKqR57DyO_dIcc9I6d0tIkxqn2VcqypLVi5YQf36WzBbPeG-iPHYpMA-bhr4rwfjKA-O6jm1NSSxNHF4sHS0YHDPoO_x6cCc677MQEe0_CozfnQhoEWNfG8tcWUqhPtmcfjqon1p7PdQoXxriq_R85d06pVO9Se7Q6ok0V8Qgz0MOJ6z3ku6mtZSuba7niMAOt2TyA\",    \"refresh_token\":\"f962d5c6-0d99-3809-8275-11c7aa0aa020\",    \"scope\":\"spei_admin\",    \"token_type\":\"Bearer\",    \"expires_in\":3600 } ```  **Suscripciones in activas**   En caso de intentar obtener el token de acceso para una suscriptión que no esta activa obtendra una respuesta de error con código 400 ``` curl -k -d \"grant_type=password&scope=spei_admin&username=6 nbC5e99tTO@sandbox.wire4com&password= Nz7IqJGe9h\" -u \" zgMlQbqmOr:plkMJoPXCI\" https://sandbox-api.wire4.mx /token  ``` ``` {     \"error_description\": \"Error while authenticating user from user store\",     \"error\": \"invalid_grant\" } ```    Una vez que la suscripción se reactive podrá generar el token de acceso de forma normal.    **Nota:** Los ejemplos anteriores se presentan considerando que se realiza una implementación desde cero,  esto se puede simplificar a sólo configurar sus llaves (*client_id*, *client_secret*),  datos de suscripción (*client_id*, *client_secret*, *user_key*, *user_secret*) si utiliza nuestros sdks.      **Consideraci&oacute;n:** Si la aplicaci&oacute;n en la que implementar&aacute; Wire4 estar&aacute; desplegada en más de una instancia o servidor en cada solicitud de token debe especificar un scope adicional. La forma de hacer esto es que, cuándo se solicita un token se debe especificar un scope adicional con el prefijo \"device_\" +  el dispositivo, por ejemplo:                                                                                                                                                                                                                     device_server1<br> device_server2  en consecuencia cada instancia debe operar con el token gestionado. ***Si se opera con el mismo token en instancias diferentes encontrará problemas de Credenciales Inv&aacute;lidas.***  **Ejemplo de solicitud de token para instancias diferentes:**  ``` curl -k -d \"grant_type=password&username=0883b97333046abb76367698b57d9e@sandbox.wire4.mx&password=9e0d81f95705079b9fe1e129315c25&scope=device_server1 codi_admin\" -H \"Authorization: Basic dmZSeURpTHdFbVZqd2VIclp0OWRMbXFmb3YwYTpJQJBuamBac3V6SllLWlJHUkJEYUZrN1BhRmNh\" https://sandbox-api.wire4.mx/token  curl -k -d \"grant_type=password&username=0883b97333046abb76367698b57d9e@sandbox.wire4.mx&password=9e0d81f95705079b9fe1e129315c25&scope=device_server2 codi_admin\" -H \"Authorization: Basic dmZSeURpTHdFbVZqd2VIclp0OWRMbXFmb3YwYTpJQJBuamBac3V6SllLWlJHUkJEYUZrN1BhRmNh\" https://sandbox-api.wire4.mx/token ```  ## Caducidad del token El token de acceso es válido durante 60 minutos (una hora), después de transcurrido este tiempo se debe solicitar un nuevo token,  cuando el token caduca se obtendrá un error ***401 Unauthorized*** con mensaje ***“Invalid Credentials”.***   El nuevo token se puede solicitar  utilizando el último token de actualización (***refresh_token***) que se devolvió en la solicitud del token,   esto sólo aplica para el token de tipo password (Autenticación de Usuario de Aplicación). El siguiente ejemplo muestra cómo obtener un toke con el token de actualización.  ``` curl -k -d \"grant_type=refresh_token&refresh_token=<refresh_token>\" -u \" Client_Id:Client_Secret\" -H \"Content-Type: application/x-www-form-urlencoded\" https://sandbox-api.wire4.mx/oauth2/token ```  **Ejemplo:**  ``` curl -k -d \"grant_type=refresh_token&refresh_token=f932d5c6-0d39-3809-8275-11c7ax0aa020\" -u \"zgMlQbqmOr:plkMJoPXCI\" -H \"Content-Type: application/x-www-form-urlencoded\" https://sandbox-api.wire4.mx/token ```  El token de actualización (***refresh_token***) tiene una duración de hasta 23 horas. Si en este periodo no se utiliza, se tienen que solicitar un nuevo token.  Un token de acceso podría dejar de funcionar por uno de estos motivos:  * El usuario ha revocado el acceso a su aplicación, si un usuario ha solicitado la baja de su aplicación de WIre4. * El token de acceso ha caducado: si el token de acceso ha pasado de una hora, recibirá un error ***401 Unauthorized*** mientras realiza una llamada a la API de Wire4. Cuando esto sucede, debe solicitar un nuevo token utilizando el token de actualización que recibió por última al solicitar un token, sólo aplica si el token en cuestión es de autenticación de usuario de aplicación, en caso contrario solicitar un nuevo token.   ## Revocar token Su aplicación puede revocar mediante programación el token de acceso, una vez revocado el token no podrá hacer uso de él para acceder a la API. El siguiente código muestra un ejemplo de cómo revocar el token:    ```  curl -X POST --basic -u \"<client id>:<client secret>\" -H \"Content-Type: application/x-www-form-urlencoded;charset=UTF-8\" -k -d \"token=<token to revoke>&token_type_hint=access_token\" https://sandbox-api.wire4.mx/revoke ```      **Ejemplo:**  ```   curl -X POST --basic -u \"8e59YqaFW_Yo5dwWNxEY8Lid0u0a:AXahn79hfKWBXKzQfj011x8cvcQa\" -H \"Content-Type: application/x-www-form-urlencoded;charset=UTF-8\" -k -d \"token=eyJ4NXQiOiJZak5sWVdWa05tWmlNR1ZoTldSaU1EUXpaREJpWlRJNU1qYzFZV1ZoWWpneU5UYzJPV05sWVEiLCJraWQiOiJZak5sWVdWa05tWmlNR1ZoTldSaU1EUXpaREJpWlRJNU1qYzFZV1ZoWWpneU5UYzJPV05sWVEiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJpc21hZWwuZXNjYW1pbGxhQHRjcGlwLnRlY2hAc2FuZGJveC5zcGVpb2suY29tIiwiYXVkIjoiOGU1OVlxYUZXX1lvNWR3V054RVk4TGlkMHUwYSIsIm5iZiI6MTU3MTMyMDg3NywiYXpwIjoiOGU1OVlxYUZXX1lvNWR3V054RVk4TGlkMHUwYSIsInNjb3BlIjoiYW1fYXBwbGljYXRpb25fc2NvcGUgZ2VuZXJhbCIsImlzcyI6ImFwaW0taWRwIiwiZXhwIjoxNTcxMzI0NDc3LCJpYXQiOjE1NzEzMjA4NzcsImp0aSI6ImJkMTdjMjcyLTg4MGQtNDk0ZS1iMTMwLTBiYTkwMjYyN2M4NCJ9.AjngGylkd_Chs5zlIjyLRPu9xPGyz4dfCd_aax2_ts653xrnNMoLpVHUDmaxIDFF2XyBJKH2IAbKxjo6VsFM07QkoPhlysO1PLoAF-Vkt4xYkh-f7nJRl0oOe2utDWFlUdgiAOmx5tPcStrdCEftgNNrjwJ50LXysFjXVshpoST-zIJPLgXknM3esGrkAsLcZRM7XUB187jxLHbtefVYPMvSO31T9pd5_Co9UXdeHpuA98sk_wZknASM1phxXQZAMLRLHz3LYvjCWCr_v80oVCM9SWTzf0vrMI6xphoIfirfWloADKPTTSUpIGBw9ePF_WbEPvbMm_BZaApJcEH2w&token_type_hint=access_token\"  https://sandbox-api.wire4.mx/revoke ```  # Ambientes  Wire4 cuentas con dos ambientes Pruebas (Sandbox) y Producción, son dos ambientes separados los cuáles se pueden utilizar simultáneamente. Los usuarios que han sido creados en cada uno de los ambientes no son intercambiables.   Las ligas de acceso a la `api` para cada uno de los ambientes son:  * Pruebas  https://sandbox-api.wire4.mx * Producción https://api.wire4.mx     # Eventos  Los eventos son nuestra forma de informarle cuando algo sucede en su cuenta. Cuando ocurre un evento se crea un objeto  [Evento](#tag/Webhook-Message). Por ejemplo, cuando se recibe un depósito, se crea un evento TRANSACTION.INCOMING.UPDATED.   Los eventos ocurren cuando cambia el estado de un recurso. El recurso se encuentra dentro del objeto [Evento](#tag/Webhook-Message) en el campo data.  Por ejemplo, un evento TRANSACTION.INCOMING.UPDATED contendrá un depósito y un evento ACCOUNT.CREATED contendrá una cuenta.   Wire4 puede agregar más campos en un futuro, o agregar nuevos valores a campos existentes, por lo que es recomendado que tu endpoint pueda manejar datos adicionales desconocidos. En esta [liga](#tag/Webhook-Message) se encuentra  la definición del objeto [Evento](#tag/Webhook-Message).  ## Tipos de Eventos  Wire4 cuenta con los siguientes tipos de eventos*   | Evento                               | Tipo                               | Objeto                                                  | | ------------------------------------ |----------------------------------- | ------------------------------------------------------- | | Suscripción                          | ENROLLMENT.CREATED                 | [suscription](#tag/subscription)                        | | Cuenta de beneficiario               | ACCOUNT.CREATED                    | [beneficiary](#tag/BeneficiaryAccount)                  | | Depósito recibido                    | TRANSACTION.INCOMING.UPDATED       | [spei_incoming](#tag/deposit)                           | | Solicitud de autorización de depósito| TRANSACTION.INCOMING.AUTHORIZATION | [spei_incoming_authorization](#tag/depositAuthorization)| | Transferencia realizada              | TRANSACTION.OUTGOING.RECEIVED      | [spei_outgoing](#tag/transfer)                          | | Transferencia SPID enviada           | TRANSACTION.OUTGOING.SPID.RECEIVED | [spid_outgoing](#tag/transfer)                          | | Transferencias Autorizadas           | REQUEST.OUTGOING.CHANGED           | [request_outgoing](#tag/requestOutMsg)                  | | Operación CoDi                       | CODI.ACTIONS                       | [codi_actions](#tag/codiActions)                        | | Punto de venta CoDi                  | SALE.POINT.CREATED                 | [codi_sales_point](#tag/codiSalesPoint)                 |   # Codigos de Error Al registrar transferencias tanto SPEI como SPID se aplican las validaciones de formato de datos a la petición descritas en la definición de cada recurso. Si la petición contiene errores, se genera una respuesta de error 409 que contiene el listado de las validaciones que no fueran exitosas.  Por cada error detectado se genera un elemento \"error\" que contiene el order_id de la transacción que genero el error, el código de error y un mensaje con más información sobre el mismo.  Si una misma transacción contiene varios errores, la respuesta  tendrá un elemento en la lista \"errors\" por cada validación que no fue exitosa.  Existen dos casos por los cuales alguno de los elementos en el listado de errores puede no contener order_id:  * Si alguna transacción no provee esta información  * En caso de transacciones SPEI, si el error está en las URLs ya que son datos relacionados a un lote de transacciones     **Ejemplo:**    ```   {      \"http_status\": 409,     \"message\": \"La divisa es incorrecta para esta transacción se espera: MXP, y se recibió: MXPD., El identificador 18e9c4a3-8c7a-42e8-99f4-ebi7r5r6y034 esta duplicado.\",     \"errors\": [         {             \"error\": \"La divisa es incorrecta para esta transacción se espera: MXP, y se recibió: MXPD.\",             \"code\": \"TR-1010\",             \"order_id\": \"18e9c4a3-8c7a-42e8-99f4-ebi7r5r6y034\"         },         {             \"error\": \"El identificador 18e9c4a3-8c7a-42e8-99f4-ebi7r5r6y034 esta duplicado.\",             \"code\": \"TR-1004\",             \"order_id\": \"18e9c4a3-8c7a-42e8-99f4-ebi7r5r6y034\"         }     ] }  ```      ## Códigos de error para generación de transferencias SPEI/SPID | Código                        | Descripción                                                                        | |-------------------------------|-----------------------------------------------------------------------------------| |A-1001     |La URL para éxito es requerida                                                                         | | A-1002  |La URL para retorno en caso de error es requerida                                                      | | TR-1001  |La petición debe incluir al menos una transacción                                                      | | TR-1002  |El identificador de la transacción es requerido                                                         | | TR-1003  |El identificador de la transacción no es valido                                                         | | TR-1004  |El identificador de la transacción esta duplicado                                                       | | TR-1005  |El monto de la transacción es requerido                                                                | | TR-1006  |El valor del monto no es valido                                                                        | | TR-1007  |La cuenta de beneficiario es requerida                                                                  | | TR-1008  |La cuenta de beneficiario no es valida                                                                  | | TR-1009  |El código de moneda es requerido                                                                       | | TR-1010  |El código de moneda no es valido                                                                       | | TR-1011  |El listado de email supera 10 elementos                                                                | | TR-1012  |La referencia es requerida                                                                             | | TR-1013  |La referencia no es valida                                                                             | | TR-1014  |El concepto es requerido                                                                               | | TR-1015  |El concepto no es valido                                                                               | | TR-1016  |El identificador de clasificación SPID es requerido                                                      |

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'uri'

module Wire4Client
  class CuentasDeBeneficiariosSPEIApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Solicitud para agrupar cuentas de beneficiarios SPEI/SPID en estado pendiente.
    # Solicta la agrupación de las cuentas de beneficiarios en estado pendiente para que sean autorizadas,  para ello se crea un conjunto de éstas que puede incluir tanto de SPEI como de SPID. Además se debe indicar las urls de redirección en caso de error y éxito
    # @param authorization Header para token
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param urls_redirect_dto Información de la cuenta del beneficiario
    # @param [Hash] opts the optional parameters
    # @return [AuthorizedBeneficiariesResponse]
    def authorize_accounts_pending_put(authorization, subscription, urls_redirect_dto, opts = {})
      data, _status_code, _headers = authorize_accounts_pending_put_with_http_info(authorization, subscription, urls_redirect_dto, opts)
      data
    end

    # Solicitud para agrupar cuentas de beneficiarios SPEI/SPID en estado pendiente.
    # Solicta la agrupación de las cuentas de beneficiarios en estado pendiente para que sean autorizadas,  para ello se crea un conjunto de éstas que puede incluir tanto de SPEI como de SPID. Además se debe indicar las urls de redirección en caso de error y éxito
    # @param authorization Header para token
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param urls_redirect_dto Información de la cuenta del beneficiario
    # @param [Hash] opts the optional parameters
    # @return [Array<(AuthorizedBeneficiariesResponse, Fixnum, Hash)>] AuthorizedBeneficiariesResponse data, response status code and response headers
    def authorize_accounts_pending_put_with_http_info(authorization, subscription, urls_redirect_dto, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CuentasDeBeneficiariosSPEIApi.authorize_accounts_pending_put ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling CuentasDeBeneficiariosSPEIApi.authorize_accounts_pending_put"
      end
      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling CuentasDeBeneficiariosSPEIApi.authorize_accounts_pending_put"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling CuentasDeBeneficiariosSPEIApi.authorize_accounts_pending_put, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling CuentasDeBeneficiariosSPEIApi.authorize_accounts_pending_put, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling CuentasDeBeneficiariosSPEIApi.authorize_accounts_pending_put, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # verify the required parameter 'urls_redirect_dto' is set
      if @api_client.config.client_side_validation && urls_redirect_dto.nil?
        fail ArgumentError, "Missing the required parameter 'urls_redirect_dto' when calling CuentasDeBeneficiariosSPEIApi.authorize_accounts_pending_put"
      end
      # resource path
      local_var_path = '/subscriptions/{subscription}/beneficiaries/pending'.sub('{' + 'subscription' + '}', subscription.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(urls_redirect_dto)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'AuthorizedBeneficiariesResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CuentasDeBeneficiariosSPEIApi#authorize_accounts_pending_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Elimina la cuenta del beneficiario
    # Elimina la cuenta de beneficiario proporcionada relacionada al contrato perteneciente a la suscripción. La cuenta a borrar debe ser una que opere con SPEI.
    # @param authorization Header para token
    # @param account Es la cuenta del beneficiario que será eliminada.
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_account_using_delete(authorization, account, subscription, opts = {})
      delete_account_using_delete_with_http_info(authorization, account, subscription, opts)
      nil
    end

    # Elimina la cuenta del beneficiario
    # Elimina la cuenta de beneficiario proporcionada relacionada al contrato perteneciente a la suscripción. La cuenta a borrar debe ser una que opere con SPEI.
    # @param authorization Header para token
    # @param account Es la cuenta del beneficiario que será eliminada.
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_account_using_delete_with_http_info(authorization, account, subscription, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CuentasDeBeneficiariosSPEIApi.delete_account_using_delete ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling CuentasDeBeneficiariosSPEIApi.delete_account_using_delete"
      end
      # verify the required parameter 'account' is set
      if @api_client.config.client_side_validation && account.nil?
        fail ArgumentError, "Missing the required parameter 'account' when calling CuentasDeBeneficiariosSPEIApi.delete_account_using_delete"
      end
      if @api_client.config.client_side_validation && account.to_s.length > 18
        fail ArgumentError, 'invalid value for "account" when calling CuentasDeBeneficiariosSPEIApi.delete_account_using_delete, the character length must be smaller than or equal to 18.'
      end

      if @api_client.config.client_side_validation && account.to_s.length < 10
        fail ArgumentError, 'invalid value for "account" when calling CuentasDeBeneficiariosSPEIApi.delete_account_using_delete, the character length must be great than or equal to 10.'
      end

      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling CuentasDeBeneficiariosSPEIApi.delete_account_using_delete"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling CuentasDeBeneficiariosSPEIApi.delete_account_using_delete, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling CuentasDeBeneficiariosSPEIApi.delete_account_using_delete, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling CuentasDeBeneficiariosSPEIApi.delete_account_using_delete, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/subscriptions/{subscription}/beneficiaries/spei/{account}'.sub('{' + 'account' + '}', account.to_s).sub('{' + 'subscription' + '}', subscription.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CuentasDeBeneficiariosSPEIApi#delete_account_using_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Consulta de relaciones
    # Obtiene las posibles relaciones existentes para registrar beneficiarios en Monex. Se debe invocar este recurso antes de pre-registrar una cuenta de beneficiario.
    # @param authorization Header para token
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param [Hash] opts the optional parameters
    # @return [RelationshipsResponse]
    def get_available_relationships_monex_using_get(authorization, subscription, opts = {})
      data, _status_code, _headers = get_available_relationships_monex_using_get_with_http_info(authorization, subscription, opts)
      data
    end

    # Consulta de relaciones
    # Obtiene las posibles relaciones existentes para registrar beneficiarios en Monex. Se debe invocar este recurso antes de pre-registrar una cuenta de beneficiario.
    # @param authorization Header para token
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param [Hash] opts the optional parameters
    # @return [Array<(RelationshipsResponse, Fixnum, Hash)>] RelationshipsResponse data, response status code and response headers
    def get_available_relationships_monex_using_get_with_http_info(authorization, subscription, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CuentasDeBeneficiariosSPEIApi.get_available_relationships_monex_using_get ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling CuentasDeBeneficiariosSPEIApi.get_available_relationships_monex_using_get"
      end
      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling CuentasDeBeneficiariosSPEIApi.get_available_relationships_monex_using_get"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling CuentasDeBeneficiariosSPEIApi.get_available_relationships_monex_using_get, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling CuentasDeBeneficiariosSPEIApi.get_available_relationships_monex_using_get, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling CuentasDeBeneficiariosSPEIApi.get_available_relationships_monex_using_get, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/subscriptions/{subscription}/beneficiaries/relationships'.sub('{' + 'subscription' + '}', subscription.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'RelationshipsResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CuentasDeBeneficiariosSPEIApi#get_available_relationships_monex_using_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Consulta los beneficiarios por el identificador de la petición de registro
    # Obtiene los beneficiarios enviados para registro en una petición al contrato relacionado con la suscripción, Los beneficiarios son los que actualmente se encuentran registrados en banca Monex, que pertenezcan a la petición que se solicita.
    # @param authorization Header para token
    # @param request_id El identificador de la petición del registro de beneficiarios a esta API.
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param [Hash] opts the optional parameters
    # @return [BeneficiariesResponse]
    def get_beneficiaries_by_request_id(authorization, request_id, subscription, opts = {})
      data, _status_code, _headers = get_beneficiaries_by_request_id_with_http_info(authorization, request_id, subscription, opts)
      data
    end

    # Consulta los beneficiarios por el identificador de la petición de registro
    # Obtiene los beneficiarios enviados para registro en una petición al contrato relacionado con la suscripción, Los beneficiarios son los que actualmente se encuentran registrados en banca Monex, que pertenezcan a la petición que se solicita.
    # @param authorization Header para token
    # @param request_id El identificador de la petición del registro de beneficiarios a esta API.
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param [Hash] opts the optional parameters
    # @return [Array<(BeneficiariesResponse, Fixnum, Hash)>] BeneficiariesResponse data, response status code and response headers
    def get_beneficiaries_by_request_id_with_http_info(authorization, request_id, subscription, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CuentasDeBeneficiariosSPEIApi.get_beneficiaries_by_request_id ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling CuentasDeBeneficiariosSPEIApi.get_beneficiaries_by_request_id"
      end
      # verify the required parameter 'request_id' is set
      if @api_client.config.client_side_validation && request_id.nil?
        fail ArgumentError, "Missing the required parameter 'request_id' when calling CuentasDeBeneficiariosSPEIApi.get_beneficiaries_by_request_id"
      end
      if @api_client.config.client_side_validation && request_id.to_s.length > 36
        fail ArgumentError, 'invalid value for "request_id" when calling CuentasDeBeneficiariosSPEIApi.get_beneficiaries_by_request_id, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && request_id.to_s.length < 36
        fail ArgumentError, 'invalid value for "request_id" when calling CuentasDeBeneficiariosSPEIApi.get_beneficiaries_by_request_id, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && request_id !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'request_id' when calling CuentasDeBeneficiariosSPEIApi.get_beneficiaries_by_request_id, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling CuentasDeBeneficiariosSPEIApi.get_beneficiaries_by_request_id"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling CuentasDeBeneficiariosSPEIApi.get_beneficiaries_by_request_id, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling CuentasDeBeneficiariosSPEIApi.get_beneficiaries_by_request_id, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling CuentasDeBeneficiariosSPEIApi.get_beneficiaries_by_request_id, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/subscriptions/{subscription}/beneficiaries/spei/{requestId}'.sub('{' + 'requestId' + '}', request_id.to_s).sub('{' + 'subscription' + '}', subscription.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'BeneficiariesResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CuentasDeBeneficiariosSPEIApi#get_beneficiaries_by_request_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Consulta los beneficiarios registrados
    # Obtiene los beneficiarios registrados al contrato relacionado con la suscripción, Los beneficiarios son los que actualmente se encuentran registrados en banca Monex.
    # @param authorization Header para token
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :account Es la cuenta del beneficiario, podría ser teléfono celular (es de 10 dígitos), Tarjeta de débito (TDD, es de 16 dígitos) o cuenta CLABE (es de 18 dígitos). &lt;br/&gt;&lt;br/&gt;Por ejemplo Teléfono celular: 5525072600, TDD: 4323 1234 5678 9123, CLABE: 032180000118359719.
    # @option opts [String] :beneficiary_bank Es la clave del banco beneficiario. Se puede obtener del recurso de las &lt;a href&#x3D;\&quot;#operation/getAllInstitutionsUsingGET\&quot;&gt;instituciones.&lt;/a&gt;
    # @option opts [String] :beneficiary_name Es el nombre del beneficiario.
    # @option opts [String] :end_date Es la fecha de inicio del perido a filtrar en formato dd-mm-yyyy.
    # @option opts [String] :init_date Es la fºecha de inicio del perido a filtrar en formato dd-mm-yyyy.
    # @option opts [String] :rfc Es el Registro Federal de Controbuyentes (RFC) del beneficiario.
    # @option opts [String] :status Es el estado (estatus) de la cuenta. Los valores pueden ser &lt;b&gt;PENDING&lt;/b&gt; y &lt;b&gt;REGISTERED&lt;/b&gt;.
    # @return [BeneficiariesResponse]
    def get_beneficiaries_for_account_using_get(authorization, subscription, opts = {})
      data, _status_code, _headers = get_beneficiaries_for_account_using_get_with_http_info(authorization, subscription, opts)
      data
    end

    # Consulta los beneficiarios registrados
    # Obtiene los beneficiarios registrados al contrato relacionado con la suscripción, Los beneficiarios son los que actualmente se encuentran registrados en banca Monex.
    # @param authorization Header para token
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :account Es la cuenta del beneficiario, podría ser teléfono celular (es de 10 dígitos), Tarjeta de débito (TDD, es de 16 dígitos) o cuenta CLABE (es de 18 dígitos). &lt;br/&gt;&lt;br/&gt;Por ejemplo Teléfono celular: 5525072600, TDD: 4323 1234 5678 9123, CLABE: 032180000118359719.
    # @option opts [String] :beneficiary_bank Es la clave del banco beneficiario. Se puede obtener del recurso de las &lt;a href&#x3D;\&quot;#operation/getAllInstitutionsUsingGET\&quot;&gt;instituciones.&lt;/a&gt;
    # @option opts [String] :beneficiary_name Es el nombre del beneficiario.
    # @option opts [String] :end_date Es la fecha de inicio del perido a filtrar en formato dd-mm-yyyy.
    # @option opts [String] :init_date Es la fºecha de inicio del perido a filtrar en formato dd-mm-yyyy.
    # @option opts [String] :rfc Es el Registro Federal de Controbuyentes (RFC) del beneficiario.
    # @option opts [String] :status Es el estado (estatus) de la cuenta. Los valores pueden ser &lt;b&gt;PENDING&lt;/b&gt; y &lt;b&gt;REGISTERED&lt;/b&gt;.
    # @return [Array<(BeneficiariesResponse, Fixnum, Hash)>] BeneficiariesResponse data, response status code and response headers
    def get_beneficiaries_for_account_using_get_with_http_info(authorization, subscription, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CuentasDeBeneficiariosSPEIApi.get_beneficiaries_for_account_using_get ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling CuentasDeBeneficiariosSPEIApi.get_beneficiaries_for_account_using_get"
      end
      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling CuentasDeBeneficiariosSPEIApi.get_beneficiaries_for_account_using_get"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling CuentasDeBeneficiariosSPEIApi.get_beneficiaries_for_account_using_get, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling CuentasDeBeneficiariosSPEIApi.get_beneficiaries_for_account_using_get, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling CuentasDeBeneficiariosSPEIApi.get_beneficiaries_for_account_using_get, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/subscriptions/{subscription}/beneficiaries/spei'.sub('{' + 'subscription' + '}', subscription.to_s)

      # query parameters
      query_params = {}
      query_params[:'account'] = opts[:'account'] if !opts[:'account'].nil?
      query_params[:'beneficiary_bank'] = opts[:'beneficiary_bank'] if !opts[:'beneficiary_bank'].nil?
      query_params[:'beneficiary_name'] = opts[:'beneficiary_name'] if !opts[:'beneficiary_name'].nil?
      query_params[:'end_date'] = opts[:'end_date'] if !opts[:'end_date'].nil?
      query_params[:'init_date'] = opts[:'init_date'] if !opts[:'init_date'].nil?
      query_params[:'rfc'] = opts[:'rfc'] if !opts[:'rfc'].nil?
      query_params[:'status'] = opts[:'status'] if !opts[:'status'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'BeneficiariesResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CuentasDeBeneficiariosSPEIApi#get_beneficiaries_for_account_using_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Pre-registro de cuentas de beneficiarios SPEI®.
    # Pre-registra una o más cuentas de beneficiario en la plataforma de Wire4, ésta le proporcionará una URL donde lo llevará al centro de autorización para que el cuentahabiente Monex ingrese su llave digital para confirmar el alta de las cuentas de beneficiarios.<br/> Los posibles valores de <em>relationship</em> y <em>kind_of_relationship</em> se deben  obtener de <a href=\"#operation/getAvailableRelationshipsMonexUsingGET\">/subscriptions/{subscription}/beneficiaries/relationships.</a><br/><br/>La confirmación de registro en Monex se realizará a través de una notificación a los webhooks registrados con el evento de tipo <a href=\"#section/Eventos/Tipos-de-Eventos\">ACCOUNT.CREATED.</a>
    # @param authorization Header para token
    # @param request_dto Información de la cuenta del beneficiario
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param [Hash] opts the optional parameters
    # @return [TokenRequiredResponse]
    def pre_register_accounts_using_post(authorization, request_dto, subscription, opts = {})
      data, _status_code, _headers = pre_register_accounts_using_post_with_http_info(authorization, request_dto, subscription, opts)
      data
    end

    # Pre-registro de cuentas de beneficiarios SPEI®.
    # Pre-registra una o más cuentas de beneficiario en la plataforma de Wire4, ésta le proporcionará una URL donde lo llevará al centro de autorización para que el cuentahabiente Monex ingrese su llave digital para confirmar el alta de las cuentas de beneficiarios.&lt;br/&gt; Los posibles valores de &lt;em&gt;relationship&lt;/em&gt; y &lt;em&gt;kind_of_relationship&lt;/em&gt; se deben  obtener de &lt;a href&#x3D;\&quot;#operation/getAvailableRelationshipsMonexUsingGET\&quot;&gt;/subscriptions/{subscription}/beneficiaries/relationships.&lt;/a&gt;&lt;br/&gt;&lt;br/&gt;La confirmación de registro en Monex se realizará a través de una notificación a los webhooks registrados con el evento de tipo &lt;a href&#x3D;\&quot;#section/Eventos/Tipos-de-Eventos\&quot;&gt;ACCOUNT.CREATED.&lt;/a&gt;
    # @param authorization Header para token
    # @param request_dto Información de la cuenta del beneficiario
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param [Hash] opts the optional parameters
    # @return [Array<(TokenRequiredResponse, Fixnum, Hash)>] TokenRequiredResponse data, response status code and response headers
    def pre_register_accounts_using_post_with_http_info(authorization, request_dto, subscription, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CuentasDeBeneficiariosSPEIApi.pre_register_accounts_using_post ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling CuentasDeBeneficiariosSPEIApi.pre_register_accounts_using_post"
      end
      # verify the required parameter 'request_dto' is set
      if @api_client.config.client_side_validation && request_dto.nil?
        fail ArgumentError, "Missing the required parameter 'request_dto' when calling CuentasDeBeneficiariosSPEIApi.pre_register_accounts_using_post"
      end
      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling CuentasDeBeneficiariosSPEIApi.pre_register_accounts_using_post"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling CuentasDeBeneficiariosSPEIApi.pre_register_accounts_using_post, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling CuentasDeBeneficiariosSPEIApi.pre_register_accounts_using_post, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling CuentasDeBeneficiariosSPEIApi.pre_register_accounts_using_post, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/subscriptions/{subscription}/beneficiaries/spei'.sub('{' + 'subscription' + '}', subscription.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request_dto)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TokenRequiredResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CuentasDeBeneficiariosSPEIApi#pre_register_accounts_using_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Eliminación de beneficiarios SPEI® sin confirmar
    # Elimina uno o más beneficiarios que se encuentran en estado pendiente de confirmar (autorizar) de la cuenta del cliente Monex relacionada a la suscripción.
    # @param authorization Header para token
    # @param request_id Es el identificador con el que se dió de alta a los beneficiarios (viene en el cuerpo de la respuesta del &lt;a href&#x3D;\&quot;#operation/getAvailableRelationshipsMonexUsingGET\&quot;&gt;pre-registro de beneficiarios&lt;/a&gt;), los registros bajo éste campo van a ser eliminados.
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def remove_beneficiaries_pending_using_delete(authorization, request_id, subscription, opts = {})
      remove_beneficiaries_pending_using_delete_with_http_info(authorization, request_id, subscription, opts)
      nil
    end

    # Eliminación de beneficiarios SPEI® sin confirmar
    # Elimina uno o más beneficiarios que se encuentran en estado pendiente de confirmar (autorizar) de la cuenta del cliente Monex relacionada a la suscripción.
    # @param authorization Header para token
    # @param request_id Es el identificador con el que se dió de alta a los beneficiarios (viene en el cuerpo de la respuesta del &lt;a href&#x3D;\&quot;#operation/getAvailableRelationshipsMonexUsingGET\&quot;&gt;pre-registro de beneficiarios&lt;/a&gt;), los registros bajo éste campo van a ser eliminados.
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def remove_beneficiaries_pending_using_delete_with_http_info(authorization, request_id, subscription, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CuentasDeBeneficiariosSPEIApi.remove_beneficiaries_pending_using_delete ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling CuentasDeBeneficiariosSPEIApi.remove_beneficiaries_pending_using_delete"
      end
      # verify the required parameter 'request_id' is set
      if @api_client.config.client_side_validation && request_id.nil?
        fail ArgumentError, "Missing the required parameter 'request_id' when calling CuentasDeBeneficiariosSPEIApi.remove_beneficiaries_pending_using_delete"
      end
      if @api_client.config.client_side_validation && request_id !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'request_id' when calling CuentasDeBeneficiariosSPEIApi.remove_beneficiaries_pending_using_delete, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling CuentasDeBeneficiariosSPEIApi.remove_beneficiaries_pending_using_delete"
      end
      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling CuentasDeBeneficiariosSPEIApi.remove_beneficiaries_pending_using_delete, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/subscriptions/{subscription}/beneficiaries/spei/request/{requestId}'.sub('{' + 'requestId' + '}', request_id.to_s).sub('{' + 'subscription' + '}', subscription.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CuentasDeBeneficiariosSPEIApi#remove_beneficiaries_pending_using_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Solicitud para actualizar el monto límite de una cuenta
    # Se crea una solicitud para actualizar el monto límite a la cuenta de beneficiario proporcionada y relacionada al contrato perteneciente a la subscripción. Una vez enviada la solicitud se retornará una URl que lo llevará al centro de autorización para que el cuentahabiente Monex ingrese su llave digital para confirmar la actualización del monto límite. 
    # @param authorization Header para token
    # @param account Es la cuenta que va a ser actualizada.
    # @param request_dto Información de la cuenta y el monto límite a actualizar.
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param [Hash] opts the optional parameters
    # @return [TokenRequiredResponse]
    def update_amount_limit_account_using_put(authorization, account, request_dto, subscription, opts = {})
      data, _status_code, _headers = update_amount_limit_account_using_put_with_http_info(authorization, account, request_dto, subscription, opts)
      data
    end

    # Solicitud para actualizar el monto límite de una cuenta
    # Se crea una solicitud para actualizar el monto límite a la cuenta de beneficiario proporcionada y relacionada al contrato perteneciente a la subscripción. Una vez enviada la solicitud se retornará una URl que lo llevará al centro de autorización para que el cuentahabiente Monex ingrese su llave digital para confirmar la actualización del monto límite. 
    # @param authorization Header para token
    # @param account Es la cuenta que va a ser actualizada.
    # @param request_dto Información de la cuenta y el monto límite a actualizar.
    # @param subscription Es el identificador de la suscripción a esta API.
    # @param [Hash] opts the optional parameters
    # @return [Array<(TokenRequiredResponse, Fixnum, Hash)>] TokenRequiredResponse data, response status code and response headers
    def update_amount_limit_account_using_put_with_http_info(authorization, account, request_dto, subscription, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: CuentasDeBeneficiariosSPEIApi.update_amount_limit_account_using_put ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling CuentasDeBeneficiariosSPEIApi.update_amount_limit_account_using_put"
      end
      # verify the required parameter 'account' is set
      if @api_client.config.client_side_validation && account.nil?
        fail ArgumentError, "Missing the required parameter 'account' when calling CuentasDeBeneficiariosSPEIApi.update_amount_limit_account_using_put"
      end
      if @api_client.config.client_side_validation && account.to_s.length > 18
        fail ArgumentError, 'invalid value for "account" when calling CuentasDeBeneficiariosSPEIApi.update_amount_limit_account_using_put, the character length must be smaller than or equal to 18.'
      end

      if @api_client.config.client_side_validation && account.to_s.length < 10
        fail ArgumentError, 'invalid value for "account" when calling CuentasDeBeneficiariosSPEIApi.update_amount_limit_account_using_put, the character length must be great than or equal to 10.'
      end

      # verify the required parameter 'request_dto' is set
      if @api_client.config.client_side_validation && request_dto.nil?
        fail ArgumentError, "Missing the required parameter 'request_dto' when calling CuentasDeBeneficiariosSPEIApi.update_amount_limit_account_using_put"
      end
      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling CuentasDeBeneficiariosSPEIApi.update_amount_limit_account_using_put"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling CuentasDeBeneficiariosSPEIApi.update_amount_limit_account_using_put, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling CuentasDeBeneficiariosSPEIApi.update_amount_limit_account_using_put, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling CuentasDeBeneficiariosSPEIApi.update_amount_limit_account_using_put, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/subscriptions/{subscription}/beneficiaries/spei/{account}'.sub('{' + 'account' + '}', account.to_s).sub('{' + 'subscription' + '}', subscription.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request_dto)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TokenRequiredResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: CuentasDeBeneficiariosSPEIApi#update_amount_limit_account_using_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
