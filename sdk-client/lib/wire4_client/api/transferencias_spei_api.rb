=begin
#Wire4RestAPI

# # Referencia de API La API de Wire4 está organizada en torno a REST. Nuestra API tiene URLs predecibles orientadas a los recursos, acepta peticiones en formato JSON, y las respuestas devueltas son formato JSON y utiliza códigos de respuesta HTTP, autenticación y verbos estándares.  Puede usar la API de Wire4 en nuestro entorno de prueba, que no afecta sus productivos ni interactúa con la red bancaria. La URL de conexión que se usa para invocar los servicios determina si la solicitud es en modo en de prueba o en modo producción.    # Autenticación La API de Wire4 utiliza el protocolo OAuth 2.0 para autenticación y autorización.   Para comenzar, es necesario que registre una cuenta en nuestro ambiente de pruebas en [registro](https://app-sndbx.wire4.mx/#/register) y obtenga las credenciales de cliente OAuth 2.0 desde la [consola de administración](https://app-sndbx.wire4.mx/#/dashboard/api-keys).   Esta página ofrece una descripción general de los escenarios de autorización de OAuth 2.0 que admite Wire4.   Después de crear su aplicación con Wire4, asegúrese de tener a la mano su `client_id` y `client_secret`. El siguiente paso es descubrir qué flujo de OAuth2 es el adecuado para sus propósitos.   ## URLS La siguiente tabla muestra las urls de los recursos de autenticación para el ambiente de pruebas.  URL                  | Descripción ------------------------------------ | ------------- https://sandbox-api.wire4.mx/token   | Obtener token de autorización llaves de API (*client_id*, *client_secret*), datos de suscripción (*client_id*, *client_secret*, *user_key*, *user_secret*) o (*refresh_token*) https://sandbox-api.wire4.mx/revoke  | Revocación de token  **Nota:** De acuerdo con el RFC 6749, la URL del token sólo acepta el tipo de contenido x-www-form-urlencoded. El contenido JSON no está permitido y devolverá un error.  ## Scopes Los `scopes` limitan el acceso de una aplicación a los recursos de Wire4. Se ofrecen los siguientes scopes de acuerdo al producto:  Producto                             |Scope                      | Descripción -------------------------------------|------------------------------------ | ------------- SPEI-SPID                            |general                              | Permite llamar a operaciones que no requieren a un cliente Monex suscrito en Wire4, los recursos que se pueden consumir con este scope son: consulta de Instituciones, CEP y generación de una presuscripción. SPEI-SPID                            |spei_admin                           | Permite llamar a operaciones que requieren de un cliente Monex suscrito en Wire4, ya que se proporciona información de saldos, administración de transacciones, cuentas de beneficiarios y cuentas de depositantes. SPEI-SPID                            |spid_admin                           | Permite llamar sólo a operaciones SPID, se requiere de un cliente Monex suscrito en Wire4. CODI                                 |codi_general                         | Permite llamar a operaciones de administración sobre el producto CoDi, como creación y listado de empresas  CODI                                 |codi_admin                           | Permite llamar sólo a operaciones CoDi dentro de un punto de venta, las operaciones incluyen creación, consulta, listado, etc de peticiones de pago CODI                                 |codi_report                          | Permite generar reportes de operaciones CoDi. TODOS                                |device_[dispositivo]                 | Se debe especificar cuando se gestionan token's desde distintos dispositivos.  ## Tipos de autenticación   Wire4 cuenta con dos tipos de autenticación: Autenticación de Aplicación (OAuth 2.0  Client Credentials Grant)  y Autenticación de Usuario de Aplicación (OAuth 2.0 Password Grant).  ### Autenticación de Aplicación  Esta autenticación se obtiene proporcionando únicamente las llaves de API las cuales se pueden consultar en [Llaves de API](https://app-sndbx.wire4.mx/#/dashboard/api-keys) de la consola de administración.  La autenticación de aplicación permite accesso a recursos generales y de administración que dependeran del scope.  Para este tipo de autenticación se sigue el flujo OAuth 2.0 Client Credentials Grant, que se describe más adelante en **Obtener el token de acceso de aplicación**, algunos de los recursos que requieren este tipo de autenticación son:   * [/subscriptions/pre-subscription](link) * [/institutions](link>) * [/ceps](<link>) * [/codi/compaies](<link>)  ### Autenticación de Usuario de Aplicación  Esta autenticación se obtiene proporcionando las llaves de API las cuales se pueden consultar en [Llaves de API](https://app-sndbx.wire4.mx/#/dashboard/api-keys) más el ***user_key*** y ***user_secret*** que se proporcionan al momento de crear una suscripción o un punto de venta, para más información puedes consultar las guías [creación de suscripción](https://www.wire4.mx/#/guides/subscriptions), [creación de punto de venta](https://www.wire4.mx/#/guides/salespoint).  Con este tipo de autenticación se puede acceder a los recursos especificos que requieren configuraciones y acceso mas puntual como información de una cuentas, saldos y administración de transacciones SPEID-SPID o CODI.    ## Obtener token de acceso Antes de que su aplicación pueda acceder a los datos mediante la API de Wire4, debe obtener un token de acceso ***(access_token)*** que le otorgue acceso a la API. En las siguientes secciones se muestra como obtener un token para cada una de las autenticaciones.     ### Obtener el token de acceso para autenticación de aplicación  El primer paso es crear la solicitud de token de acceso (*access_token*), con los parámetros que identifican su aplicación, el siguiente código muestra cómo obtener un `token`.  ``` curl -k -d \"grant_type= client_credentials&scope=general\"  -u \"<client id>:<client secret>\" https://sandbox-api.wire4.mx/token ``` **Ejemplo:**   ``` curl -k -d \"grant_type=client_credentials&scope=general\"  -u \"8e59YqaFW_Yo5dwWNxEY8Lid0u0a:AXahn79hfKWBXKzQfj011x8cvcQa\"  https://sandbox-api.wire4.mx /token ``` Obtendrá una respuesta como la que se muestra  a continuación, donde se debe obtener el *access_token* para realizar llamadas posteriores a la API.   ``` {     \"access_token\":\"eyJ4NXQiOiJZak5sWVdWa05tWmlNR1ZoTldSaU1EUXpaREJpWlRJNU1qYzFZV1ZoWWpneU5UYzJPV05sWVEiLCJraWQiOiJZak5sWVdWa05tWmlNR1ZoTldSaU1EUXpaREJpWlRJNU1qYzFZV1ZoWWpneU5UYzJPV05sWVEiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJpc21hZWwuZXNjYW1pbGxhQHRjcGlwLnRlY2hAc2FuZGJveC5zcGVpb2suY29tIiwiYXVkIjoiOGU1OVlxYUZXX1lvNWR3V054RVk4TGlkMHUwYSIsIm5iZiI6MTU3MTMyMDg3NywiYXpwIjoiOGU1OVlxYUZXX1lvNWR3V054RVk4TGlkMHUwYSIsInNjb3BlIjoiYW1fYXBwbGljYXRpb25fc2NvcGUgZ2VuZXJhbCIsImlzcyI6ImFwaW0taWRwIiwiZXhwIjoxNTcxMzI0NDc3LCJpYXQiOjE1NzEzMjA4NzcsImp0aSI6ImJkMTdjMjcyLTg4MGQtNDk0ZS1iMTMwLTBiYTkwMjYyN2M4NCJ9.AjngGylkd_Chs5zlIjyLRPu9xPGyz4dfCd_aax2_ts653xrnNMoLpVHUDmaxIDFF2XyBJKH2IAbKxjo6VsFM07QkoPhlysO1PLoAF-Vkt4xYkh-f7nJRl0oOe2utDWFlUdgiAOmx5tPcStrdCEftgNNrjwJ50LXysFjXVshpoST-zIJPLgXknM3esGrkAsLcZRM7XUB187jxLHbtefVYPMvSO31T9pd5_Co9UXdeHpuA98sk_wZknASM1phxXQZAMLRLHz3LYvjCWCr_v80oVCM9SWTzf0vrMI6xphoIfirfWloADKPTTSUpIGBw9ePF_WbEPvbMm_BZaApJcEH2w\",    \"scope\":\"am_application_scope general\",    \"token_type\":\"Bearer\",    \"expires_in\":3600 }  ```  Es posible generar tokens con mas de un scope, en caso que sea necesario utilizar dicho token para hacer mas de una operación. Para generarlo basta con agregarlo a la petición separado por un espacio.     ``` curl -k -d \"grant_type=client_credentials&scope=codi_general codi_report\"  -u \"8e59YqaFW_Yo5dwWNxEY8Lid0u0a:AXahn79hfKWBXKzQfj011x8cvcQa\"  https://sandbox-api.wire4.mx /token ```  ### Obtener el token de acceso para autenticación usuario de aplicación   Antes de que su aplicación pueda acceder a los datos de una cuenta Monex mediante la API de Wire4, debe obtener un token de acceso  (*access_token*) que le otorgue acceso a la API y contar con el  *user_key* y *user_secret* que se proporcionan al momento de crear  una suscripción para más información puedes consultar [creación de suscripción](https://wire4.mx/#/guides/subscriptions) .   El primer paso es crear la solicitud de token de acceso con los parámetros que identifican su aplicación y la suscripción y con `scope` `spei_admin`  ```   curl -k -d \"grant_type=password&scope=spei_admin&username=<user_key>&password=<user_secret>\"  -u \"<client_id>:<client_secret>\" https://sandbox-api.wire4.mx/token ``` **Ejemplo**  ``` curl -k -d \"grant_type=password&scope=spei_admin&username=6 nbC5e99tTO@sandbox.wire4com&password= Nz7IqJGe9h\" -u \" zgMlQbqmOr:plkMJoPXCI\" https://sandbox-api.wire4.mx /token  ```  ``` {     \"access_token\":\"eyJ4NXQiOiJPR1EyTURFM00yTmpObVZoTnpFeE5EWXlObUV4TURKa01qUTJaVEU0TWpGaE1tVmlZakV5TkEiLCJraWQiOiJPR1EyTURFM00yTmpObVZoTnpFeE5EWXlObUV4TURKa01qUTJaVEU0TWpGaE1tVmlZakV5TkEiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzMzE0ODRlZTdjZDRkYWU5MzRmMjY2Zjc5YmY1YWFAZGV2LWllc2NhbWlsbGEuc3BlaW9rLmNvbSIsImF1ZCI6IkJVR0xjNWw1bW5CZXlPeGxtamNUZ0JoS19WTWEiLCJuYmYiOjE1NzEzNDk4ODMsImF6cCI6IkJVR0xjNWw1bW5CZXlPeGxtamNUZ0JoS19WTWEiLCJzY29wZSI6InNwZWlfYWRtaW4iLCJpc3MiOiJhcGltLWlkcCIsImV4cCI6MTU3MTM1MzQ4MywiaWF0IjoxNTcxMzQ5ODgzLCJqdGkiOiJiOWQ1M2Q0MC0xN2MwLTQxOTItYjUwNy0wZWFhN2ZkNDA1MGYifQ.hLTk8AFoIce1GpLcgch-U5aLLgiiFTo49wfBErD8D6VF-H9sG13ZyfAx9T-vQkk2m1zPapYVQjwibz3GRAJMN0Vczs6flV1mUJwFDQbEE-AELPdRcaRFOMBCfF6H9TVLfhFsGb9U2pVR9TLJcKqR57DyO_dIcc9I6d0tIkxqn2VcqypLVi5YQf36WzBbPeG-iPHYpMA-bhr4rwfjKA-O6jm1NSSxNHF4sHS0YHDPoO_x6cCc677MQEe0_CozfnQhoEWNfG8tcWUqhPtmcfjqon1p7PdQoXxriq_R85d06pVO9Se7Q6ok0V8Qgz0MOJ6z3ku6mtZSuba7niMAOt2TyA\",    \"refresh_token\":\"f962d5c6-0d99-3809-8275-11c7aa0aa020\",    \"scope\":\"spei_admin\",    \"token_type\":\"Bearer\",    \"expires_in\":3600 } ```  **Nota:** Los ejemplos anteriores se presentan considerando que se realiza una implementación desde cero,  esto se puede simplificar a sólo configurar sus llaves (*client_id*, *client_secret*),  datos de suscripción (*client_id*, *client_secret*, *user_key*, *user_secret*) si utiliza nuestros sdks.      **Consideraci&oacute;n:** Si la aplicaci&oacute;n en la que implementar&aacute; Wire4 estar&aacute; desplegada en mas de una instancia o servidor en cada solicitud de token debe especificar un scope adicional. La forma de hacer esto es que cuando se solicita un token se debe especificar un scope adicional con el prefijo \"device_\" +  el dispositivo, por ejemplo:                                                                                                                                                                                                                     device_server1<br> device_server2  en consecuencia cada instancia debe operar con el token gestionado. ***Si se opera con el mismo token en instancias diferentes encontrará problemas de Credenciales Inv&aacute;lidas.***  **Ejemplo de solicitud de token para instancias diferentes:**  ``` curl -k -d \"grant_type=password&username=0883b97333046abb76367698b57d9e@sandbox.wire4.mx&password=9e0d81f95705079b9fe1e129315c25&scope=device_server1 codi_admin\" -H \"Authorization: Basic dmZSeURpTHdFbVZqd2VIclp0OWRMbXFmb3YwYTpJQJBuamBac3V6SllLWlJHUkJEYUZrN1BhRmNh\" https://sandbox-api.wire4.mx/token  curl -k -d \"grant_type=password&username=0883b97333046abb76367698b57d9e@sandbox.wire4.mx&password=9e0d81f95705079b9fe1e129315c25&scope=device_server2 codi_admin\" -H \"Authorization: Basic dmZSeURpTHdFbVZqd2VIclp0OWRMbXFmb3YwYTpJQJBuamBac3V6SllLWlJHUkJEYUZrN1BhRmNh\" https://sandbox-api.wire4.mx/token ```  ## Caducidad del token El token de acceso es válido durante 60 minutos (una hora), después de transcurrido este tiempo se debe solicitar un nuevo token,  cuando el token caduca se obtendrá un error ***401 Unauthorized*** con mensaje ***“Invalid Credentials”.***   El nuevo token se puede solicitar  utilizando el último token de actualización (***refresh_token***) que se devolvió en la solicitud del token,   esto sólo aplica para el token de tipo password (Autenticación de Usuario de Aplicación). El siguiente ejemplo muestra cómo obtener un toke con el token de actualización.  ``` curl -k -d \"grant_type=refresh_token&refresh_token=<refresh_token>\" -u \" Client_Id:Client_Secret\" -H \"Content-Type: application/x-www-form-urlencoded\" https://sandbox-api.wire4.mx/oauth2/token ```  **Ejemplo:**  ``` curl -k -d \"grant_type=refresh_token&refresh_token=f932d5c6-0d39-3809-8275-11c7ax0aa020\" -u \"zgMlQbqmOr:plkMJoPXCI\" -H \"Content-Type: application/x-www-form-urlencoded\" https://sandbox-api.wire4.mx/token ```  El token de actualización (***refresh_token***) tiene una duración de hasta 23 horas. Si en este periodo no se utiliza, se tienen que solicitar un nuevo token.  Un token de acceso podría dejar de funcionar por uno de estos motivos:  * El usuario ha revocado el acceso a su aplicación, si un usuario ha solicitado la baja de su aplicación de WIre4. * El token de acceso ha caducado: si el token de acceso ha pasado de una hora, recibirá un error ***401 Unauthorized*** mientras realiza una llamada a la API de Wire4. Cuando esto sucede, debe solicitar un nuevo token utilizando el token de actualización que recibió por última al solicitar un token, sólo aplica si el token en cuestión es de autenticación de usuario de aplicación, en caso contrario solicitar un nuevo token.   ## Revocar token Su aplicación puede revocar mediante programación el token de acceso, una vez revocado el token no podrá hacer uso de él para acceder a la API. El siguiente código muestra un ejemplo de cómo revocar el token:    ```  curl -X POST --basic -u \"<client id>:<client secret>\" -H \"Content-Type: application/x-www-form-urlencoded;charset=UTF-8\" -k -d \"token=<token to revoke>&token_type_hint=access_token\" https://sandbox-api.wire4.mx/revoke ```      **Ejemplo:**  ```   curl -X POST --basic -u \"8e59YqaFW_Yo5dwWNxEY8Lid0u0a:AXahn79hfKWBXKzQfj011x8cvcQa\" -H \"Content-Type: application/x-www-form-urlencoded;charset=UTF-8\" -k -d \"token=eyJ4NXQiOiJZak5sWVdWa05tWmlNR1ZoTldSaU1EUXpaREJpWlRJNU1qYzFZV1ZoWWpneU5UYzJPV05sWVEiLCJraWQiOiJZak5sWVdWa05tWmlNR1ZoTldSaU1EUXpaREJpWlRJNU1qYzFZV1ZoWWpneU5UYzJPV05sWVEiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJpc21hZWwuZXNjYW1pbGxhQHRjcGlwLnRlY2hAc2FuZGJveC5zcGVpb2suY29tIiwiYXVkIjoiOGU1OVlxYUZXX1lvNWR3V054RVk4TGlkMHUwYSIsIm5iZiI6MTU3MTMyMDg3NywiYXpwIjoiOGU1OVlxYUZXX1lvNWR3V054RVk4TGlkMHUwYSIsInNjb3BlIjoiYW1fYXBwbGljYXRpb25fc2NvcGUgZ2VuZXJhbCIsImlzcyI6ImFwaW0taWRwIiwiZXhwIjoxNTcxMzI0NDc3LCJpYXQiOjE1NzEzMjA4NzcsImp0aSI6ImJkMTdjMjcyLTg4MGQtNDk0ZS1iMTMwLTBiYTkwMjYyN2M4NCJ9.AjngGylkd_Chs5zlIjyLRPu9xPGyz4dfCd_aax2_ts653xrnNMoLpVHUDmaxIDFF2XyBJKH2IAbKxjo6VsFM07QkoPhlysO1PLoAF-Vkt4xYkh-f7nJRl0oOe2utDWFlUdgiAOmx5tPcStrdCEftgNNrjwJ50LXysFjXVshpoST-zIJPLgXknM3esGrkAsLcZRM7XUB187jxLHbtefVYPMvSO31T9pd5_Co9UXdeHpuA98sk_wZknASM1phxXQZAMLRLHz3LYvjCWCr_v80oVCM9SWTzf0vrMI6xphoIfirfWloADKPTTSUpIGBw9ePF_WbEPvbMm_BZaApJcEH2w&token_type_hint=access_token\"  https://sandbox-api.wire4.mx/revoke ```  # Ambientes  Wire4 cuentas con dos ambientes Pruebas (Sandbox) y Producción, son dos ambientes separados los cuales se pueden utilizar simultáneamente. Los usuarios que han sido creados en cada uno de los ambientes no son intercambiables.   Las ligas de acceso a la `api` para cada uno de los ambientes son:  * Pruebas  https://sandbox-api.wire4.mx * Producción https://api.wire4.mx     # Eventos  Los eventos son nuestra forma de informarle cuando algo  sucede en su cuenta. Cuando ocurre un evento se crea un objeto  [Evento](#tag/Webhook-Message). Por ejemplo, cuando se recibe un depósito, se crea un evento TRANSACTION.INCOMING.UPDATED.   Los eventos ocurren cuando cambia el estado de un recurso. El recurso se encuentra dentro del objeto [Evento](#tag/Webhook-Message) en el campo data.  Por ejemplo, un evento TRANSACTION.INCOMING.UPDATED contendrá un depósito y un evento ACCOUNT.CREATED contendrá una cuenta.   Wire4 puede agregar más campos en un futuro, o agregar nuevos valores a campos existentes, por lo que es recomendado que tu endpoint pueda manejar datos adicionales desconocidos. En esta [liga](#tag/Webhook-Message) se encuentra  la definición del objeto [Evento](#tag/Webhook-Message).  ## Tipos de Eventos  Wire4 cuenta con los siguientes tipos de eventos*   | Evento                     | Tipo                               | Objeto                                        | | -------------------------- |----------------------------------- | --------------------------------------------- | | Suscripción                | ENROLLMENT.CREATED                 | [suscription](#tag/subscription)              | | Cuenta de beneficiario     | ACCOUNT.CREATED                    | [beneficiary](#tag/BeneficiaryAccount)           | | Depósito recibido          | TRANSACTION.INCOMING.UPDATED       | [spei_incoming](#tag/deposit)                 | | Transferencia realizada    | TRANSACTION.OUTGOING.RECEIVED      | [spei_outgoing](#tag/transfer)                | | Transferencia SPID enviada | TRANSACTION.OUTGOING.SPID.RECEIVED | [spid_outgoing](#tag/transfer)                | | Transferencias Autorizadas | REQUEST.OUTGOING.CHANGED           | [request_outgoing](#tag/requestOutMsg)        | | Operación CoDi             | CODI.ACTIONS                       |[codi_actions](#tag/codiActions)               | | Punto de venta CoDi        | SALE.POINT.CREATED                 |[codi_sales_point](#tag/codiSalesPoint)        | 

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'uri'

module Wire4Client
  class TransferenciasSPEIApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Agrupa un conjunto de transacciones bajo un mismo request_id para autorizar
    # Agrupa transacciones SPEI/SPID en un transaction_id, generando la URL para su autorización. Las transacciones deben estar en estatus PENDING y pertenecer a un mmismo contrato
    # @param authorization Header para token
    # @param authorization_transactions_group_request_dto authorizationTransactionsGroupRequestDTO
    # @param subscription Identificador de la suscripcion
    # @param [Hash] opts the optional parameters
    # @return [TokenRequiredResponse]
    def create_authorization_transactions_group(authorization, authorization_transactions_group_request_dto, subscription, opts = {})
      data, _status_code, _headers = create_authorization_transactions_group_with_http_info(authorization, authorization_transactions_group_request_dto, subscription, opts)
      data
    end

    # Agrupa un conjunto de transacciones bajo un mismo request_id para autorizar
    # Agrupa transacciones SPEI/SPID en un transaction_id, generando la URL para su autorización. Las transacciones deben estar en estatus PENDING y pertenecer a un mmismo contrato
    # @param authorization Header para token
    # @param authorization_transactions_group_request_dto authorizationTransactionsGroupRequestDTO
    # @param subscription Identificador de la suscripcion
    # @param [Hash] opts the optional parameters
    # @return [Array<(TokenRequiredResponse, Fixnum, Hash)>] TokenRequiredResponse data, response status code and response headers
    def create_authorization_transactions_group_with_http_info(authorization, authorization_transactions_group_request_dto, subscription, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransferenciasSPEIApi.create_authorization_transactions_group ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling TransferenciasSPEIApi.create_authorization_transactions_group"
      end
      # verify the required parameter 'authorization_transactions_group_request_dto' is set
      if @api_client.config.client_side_validation && authorization_transactions_group_request_dto.nil?
        fail ArgumentError, "Missing the required parameter 'authorization_transactions_group_request_dto' when calling TransferenciasSPEIApi.create_authorization_transactions_group"
      end
      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling TransferenciasSPEIApi.create_authorization_transactions_group"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling TransferenciasSPEIApi.create_authorization_transactions_group, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling TransferenciasSPEIApi.create_authorization_transactions_group, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling TransferenciasSPEIApi.create_authorization_transactions_group, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/subscriptions/{subscription}/transactions/group'.sub('{' + 'subscription' + '}', subscription.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['*/*'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])
      header_params[:'Authorization'] = authorization

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(authorization_transactions_group_request_dto)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TokenRequiredResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransferenciasSPEIApi#create_authorization_transactions_group\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Eliminación de transferencias SPEI® pendientes
    # Elimina un conjunto de transferencias a realizar en la cuenta del cliente Monex relacionada a la suscripción, las transferencias no deben haber sido confirmadas por el cliente.
    # @param authorization Header para token
    # @param request_id Identificador de las transferencias a eliminar
    # @param subscription El identificador de la suscripción a esta API
    # @param [Hash] opts the optional parameters
    # @option opts [String] :order_id Listado de identificadores dentro del request_id para eliminar
    # @return [nil]
    def drop_transactions_pending_using_delete(authorization, request_id, subscription, opts = {})
      drop_transactions_pending_using_delete_with_http_info(authorization, request_id, subscription, opts)
      nil
    end

    # Eliminación de transferencias SPEI® pendientes
    # Elimina un conjunto de transferencias a realizar en la cuenta del cliente Monex relacionada a la suscripción, las transferencias no deben haber sido confirmadas por el cliente.
    # @param authorization Header para token
    # @param request_id Identificador de las transferencias a eliminar
    # @param subscription El identificador de la suscripción a esta API
    # @param [Hash] opts the optional parameters
    # @option opts [String] :order_id Listado de identificadores dentro del request_id para eliminar
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def drop_transactions_pending_using_delete_with_http_info(authorization, request_id, subscription, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransferenciasSPEIApi.drop_transactions_pending_using_delete ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling TransferenciasSPEIApi.drop_transactions_pending_using_delete"
      end
      # verify the required parameter 'request_id' is set
      if @api_client.config.client_side_validation && request_id.nil?
        fail ArgumentError, "Missing the required parameter 'request_id' when calling TransferenciasSPEIApi.drop_transactions_pending_using_delete"
      end
      if @api_client.config.client_side_validation && request_id.to_s.length > 36
        fail ArgumentError, 'invalid value for "request_id" when calling TransferenciasSPEIApi.drop_transactions_pending_using_delete, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && request_id.to_s.length < 36
        fail ArgumentError, 'invalid value for "request_id" when calling TransferenciasSPEIApi.drop_transactions_pending_using_delete, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && request_id !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'request_id' when calling TransferenciasSPEIApi.drop_transactions_pending_using_delete, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling TransferenciasSPEIApi.drop_transactions_pending_using_delete"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling TransferenciasSPEIApi.drop_transactions_pending_using_delete, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling TransferenciasSPEIApi.drop_transactions_pending_using_delete, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling TransferenciasSPEIApi.drop_transactions_pending_using_delete, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/subscriptions/{subscription}/transactions/outcoming/spei/request/{requestId}'.sub('{' + 'requestId' + '}', request_id.to_s).sub('{' + 'subscription' + '}', subscription.to_s)

      # query parameters
      query_params = {}
      query_params[:'order_id'] = opts[:'order_id'] if !opts[:'order_id'].nil?

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
        @api_client.config.logger.debug "API called: TransferenciasSPEIApi#drop_transactions_pending_using_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Consulta de transferencias recibidas
    # Realiza una consulta de las transferencias recibidas (depósitos) en la cuenta del cliente Monex relacionada a la suscripción, las transferencias que regresa este recuso son únicamente las transferencias  recibidas durante el día en el que se realiza la consulta.
    # @param authorization Header para token
    # @param subscription El identificador de la suscripción a esta API
    # @param [Hash] opts the optional parameters
    # @return [Array<Deposit>]
    def incoming_spei_transactions_report_using_get(authorization, subscription, opts = {})
      data, _status_code, _headers = incoming_spei_transactions_report_using_get_with_http_info(authorization, subscription, opts)
      data
    end

    # Consulta de transferencias recibidas
    # Realiza una consulta de las transferencias recibidas (depósitos) en la cuenta del cliente Monex relacionada a la suscripción, las transferencias que regresa este recuso son únicamente las transferencias  recibidas durante el día en el que se realiza la consulta.
    # @param authorization Header para token
    # @param subscription El identificador de la suscripción a esta API
    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<Deposit>, Fixnum, Hash)>] Array<Deposit> data, response status code and response headers
    def incoming_spei_transactions_report_using_get_with_http_info(authorization, subscription, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransferenciasSPEIApi.incoming_spei_transactions_report_using_get ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling TransferenciasSPEIApi.incoming_spei_transactions_report_using_get"
      end
      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling TransferenciasSPEIApi.incoming_spei_transactions_report_using_get"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling TransferenciasSPEIApi.incoming_spei_transactions_report_using_get, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling TransferenciasSPEIApi.incoming_spei_transactions_report_using_get, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling TransferenciasSPEIApi.incoming_spei_transactions_report_using_get, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/subscriptions/{subscription}/transactions/incoming/spei'.sub('{' + 'subscription' + '}', subscription.to_s)

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
        :return_type => 'Array<Deposit>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransferenciasSPEIApi#incoming_spei_transactions_report_using_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Consulta de transferencias de salida por identificador de petición
    # Consulta las transferencias de salida registradas en una petición, las transferencias que regresa este recuso son únicamente las transferencias de salida agrupadas al identificador de la petición que se generó al hacer el registro de las transacciones el cual se debe especificar como parte del path de este endpoint.
    # @param authorization Header para token
    # @param request_id Identificador de la petición a buscar
    # @param subscription El identificador de la suscripción a esta API
    # @param [Hash] opts the optional parameters
    # @return [PaymentsRequestId]
    def out_comming_spei_request_id_transactions_report_using_get(authorization, request_id, subscription, opts = {})
      data, _status_code, _headers = out_comming_spei_request_id_transactions_report_using_get_with_http_info(authorization, request_id, subscription, opts)
      data
    end

    # Consulta de transferencias de salida por identificador de petición
    # Consulta las transferencias de salida registradas en una petición, las transferencias que regresa este recuso son únicamente las transferencias de salida agrupadas al identificador de la petición que se generó al hacer el registro de las transacciones el cual se debe especificar como parte del path de este endpoint.
    # @param authorization Header para token
    # @param request_id Identificador de la petición a buscar
    # @param subscription El identificador de la suscripción a esta API
    # @param [Hash] opts the optional parameters
    # @return [Array<(PaymentsRequestId, Fixnum, Hash)>] PaymentsRequestId data, response status code and response headers
    def out_comming_spei_request_id_transactions_report_using_get_with_http_info(authorization, request_id, subscription, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransferenciasSPEIApi.out_comming_spei_request_id_transactions_report_using_get ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling TransferenciasSPEIApi.out_comming_spei_request_id_transactions_report_using_get"
      end
      # verify the required parameter 'request_id' is set
      if @api_client.config.client_side_validation && request_id.nil?
        fail ArgumentError, "Missing the required parameter 'request_id' when calling TransferenciasSPEIApi.out_comming_spei_request_id_transactions_report_using_get"
      end
      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling TransferenciasSPEIApi.out_comming_spei_request_id_transactions_report_using_get"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling TransferenciasSPEIApi.out_comming_spei_request_id_transactions_report_using_get, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling TransferenciasSPEIApi.out_comming_spei_request_id_transactions_report_using_get, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling TransferenciasSPEIApi.out_comming_spei_request_id_transactions_report_using_get, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/subscriptions/{subscription}/transactions/outcoming/spei/{requestId}'.sub('{' + 'requestId' + '}', request_id.to_s).sub('{' + 'subscription' + '}', subscription.to_s)

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
        :return_type => 'PaymentsRequestId')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransferenciasSPEIApi#out_comming_spei_request_id_transactions_report_using_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Consulta de transferencias realizadas
    # Consulta las transferencias realizadas en la cuenta del cliente Monex relacionada a la suscripción, las transferencias que regresa este recuso son únicamente las transferencias recibidas en el día en el que se realiza la consulta.<br>Se pueden realizar consultas por <strong>order_id</strong> al realizar este tipo de consultas no importa el día en el que se realizó la transferencia
    # @param authorization Header para token
    # @param subscription El identificador de la suscripción a esta API
    # @param [Hash] opts the optional parameters
    # @option opts [String] :order_id Identificador de la orden a buscar
    # @return [Array<Payment>]
    def outgoing_spei_transactions_report_using_get(authorization, subscription, opts = {})
      data, _status_code, _headers = outgoing_spei_transactions_report_using_get_with_http_info(authorization, subscription, opts)
      data
    end

    # Consulta de transferencias realizadas
    # Consulta las transferencias realizadas en la cuenta del cliente Monex relacionada a la suscripción, las transferencias que regresa este recuso son únicamente las transferencias recibidas en el día en el que se realiza la consulta.&lt;br&gt;Se pueden realizar consultas por &lt;strong&gt;order_id&lt;/strong&gt; al realizar este tipo de consultas no importa el día en el que se realizó la transferencia
    # @param authorization Header para token
    # @param subscription El identificador de la suscripción a esta API
    # @param [Hash] opts the optional parameters
    # @option opts [String] :order_id Identificador de la orden a buscar
    # @return [Array<(Array<Payment>, Fixnum, Hash)>] Array<Payment> data, response status code and response headers
    def outgoing_spei_transactions_report_using_get_with_http_info(authorization, subscription, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransferenciasSPEIApi.outgoing_spei_transactions_report_using_get ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling TransferenciasSPEIApi.outgoing_spei_transactions_report_using_get"
      end
      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling TransferenciasSPEIApi.outgoing_spei_transactions_report_using_get"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling TransferenciasSPEIApi.outgoing_spei_transactions_report_using_get, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling TransferenciasSPEIApi.outgoing_spei_transactions_report_using_get, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling TransferenciasSPEIApi.outgoing_spei_transactions_report_using_get, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/subscriptions/{subscription}/transactions/outcoming/spei'.sub('{' + 'subscription' + '}', subscription.to_s)

      # query parameters
      query_params = {}
      query_params[:'order_id'] = opts[:'order_id'] if !opts[:'order_id'].nil?

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
        :return_type => 'Array<Payment>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransferenciasSPEIApi#outgoing_spei_transactions_report_using_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Registro de transferencias
    # Registra un conjunto de transferencias a realizar en la cuenta del cliente Monex relacionada a la suscripción, las transferencias deben ser confirmadas por el cliente para que se efectuen.
    # @param authorization Header para token
    # @param subscription El identificador de la suscripción a esta API
    # @param transactions Información de las transferencias SPEI de salida
    # @param [Hash] opts the optional parameters
    # @return [TokenRequiredResponse]
    def register_outgoing_spei_transaction_using_post(authorization, subscription, transactions, opts = {})
      data, _status_code, _headers = register_outgoing_spei_transaction_using_post_with_http_info(authorization, subscription, transactions, opts)
      data
    end

    # Registro de transferencias
    # Registra un conjunto de transferencias a realizar en la cuenta del cliente Monex relacionada a la suscripción, las transferencias deben ser confirmadas por el cliente para que se efectuen.
    # @param authorization Header para token
    # @param subscription El identificador de la suscripción a esta API
    # @param transactions Información de las transferencias SPEI de salida
    # @param [Hash] opts the optional parameters
    # @return [Array<(TokenRequiredResponse, Fixnum, Hash)>] TokenRequiredResponse data, response status code and response headers
    def register_outgoing_spei_transaction_using_post_with_http_info(authorization, subscription, transactions, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransferenciasSPEIApi.register_outgoing_spei_transaction_using_post ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling TransferenciasSPEIApi.register_outgoing_spei_transaction_using_post"
      end
      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling TransferenciasSPEIApi.register_outgoing_spei_transaction_using_post"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling TransferenciasSPEIApi.register_outgoing_spei_transaction_using_post, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling TransferenciasSPEIApi.register_outgoing_spei_transaction_using_post, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling TransferenciasSPEIApi.register_outgoing_spei_transaction_using_post, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # verify the required parameter 'transactions' is set
      if @api_client.config.client_side_validation && transactions.nil?
        fail ArgumentError, "Missing the required parameter 'transactions' when calling TransferenciasSPEIApi.register_outgoing_spei_transaction_using_post"
      end
      # resource path
      local_var_path = '/subscriptions/{subscription}/transactions/outcoming/spei'.sub('{' + 'subscription' + '}', subscription.to_s)

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
      post_body = @api_client.object_to_http_body(transactions)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TokenRequiredResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransferenciasSPEIApi#register_outgoing_spei_transaction_using_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
