=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'uri'

module Wire4Client
  class DepositantesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Consulta de cuentas de depositantes
    # Obtiene una lista de depositantes asociados al contrato relacionado a la subscripción.
    # @param subscription El identificador de la suscripción a esta API
    # @param [Hash] opts the optional parameters
    # @return [GetDepositants]
    def get_depositants_using_get(subscription, opts = {})
      data, _status_code, _headers = get_depositants_using_get_with_http_info(subscription, opts)
      data
    end

    # Consulta de cuentas de depositantes
    # Obtiene una lista de depositantes asociados al contrato relacionado a la subscripción.
    # @param subscription El identificador de la suscripción a esta API
    # @param [Hash] opts the optional parameters
    # @return [Array<(GetDepositants, Fixnum, Hash)>] GetDepositants data, response status code and response headers
    def get_depositants_using_get_with_http_info(subscription, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DepositantesApi.get_depositants_using_get ...'
      end
      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling DepositantesApi.get_depositants_using_get"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling DepositantesApi.get_depositants_using_get, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling DepositantesApi.get_depositants_using_get, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling DepositantesApi.get_depositants_using_get, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/subscriptions/{subscription}/depositants'.sub('{' + 'subscription' + '}', subscription.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['wire4_aut_app_user_spei']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GetDepositants')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DepositantesApi#get_depositants_using_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Registra un nuevo depositante
    # Registra un nuevo depositante en el contrato asociado a la subscripción.
    # @param register Depositant info
    # @param subscription El identificador de la suscripción a esta API
    # @param [Hash] opts the optional parameters
    # @return [DepositantsResponse]
    def register_depositants_using_post(register, subscription, opts = {})
      data, _status_code, _headers = register_depositants_using_post_with_http_info(register, subscription, opts)
      data
    end

    # Registra un nuevo depositante
    # Registra un nuevo depositante en el contrato asociado a la subscripción.
    # @param register Depositant info
    # @param subscription El identificador de la suscripción a esta API
    # @param [Hash] opts the optional parameters
    # @return [Array<(DepositantsResponse, Fixnum, Hash)>] DepositantsResponse data, response status code and response headers
    def register_depositants_using_post_with_http_info(register, subscription, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DepositantesApi.register_depositants_using_post ...'
      end
      # verify the required parameter 'register' is set
      if @api_client.config.client_side_validation && register.nil?
        fail ArgumentError, "Missing the required parameter 'register' when calling DepositantesApi.register_depositants_using_post"
      end
      # verify the required parameter 'subscription' is set
      if @api_client.config.client_side_validation && subscription.nil?
        fail ArgumentError, "Missing the required parameter 'subscription' when calling DepositantesApi.register_depositants_using_post"
      end
      if @api_client.config.client_side_validation && subscription.to_s.length > 36
        fail ArgumentError, 'invalid value for "subscription" when calling DepositantesApi.register_depositants_using_post, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription.to_s.length < 36
        fail ArgumentError, 'invalid value for "subscription" when calling DepositantesApi.register_depositants_using_post, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && subscription !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'subscription' when calling DepositantesApi.register_depositants_using_post, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/subscriptions/{subscription}/depositants'.sub('{' + 'subscription' + '}', subscription.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(register)
      auth_names = ['wire4_aut_app_user_spei']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'DepositantsResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DepositantesApi#register_depositants_using_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end