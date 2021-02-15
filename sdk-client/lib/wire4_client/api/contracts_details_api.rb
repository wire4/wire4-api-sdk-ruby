=begin
#Wire4RestAPI

#Referencia de API. La API de Wire4 está organizada en torno a REST

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'uri'

module Wire4Client
  class ContractsDetailsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Devuelve la URL para autorización del usuario Monex
    # Se obtiene la URL para la autorización del usuario Monex.
    # @param authorization Header para token
    # @param pre_monex_authorization Información para la autorización
    # @param [Hash] opts the optional parameters
    # @return [TokenRequiredResponse]
    def create_authorization(authorization, pre_monex_authorization, opts = {})
      data, _status_code, _headers = create_authorization_with_http_info(authorization, pre_monex_authorization, opts)
      data
    end

    # Devuelve la URL para autorización del usuario Monex
    # Se obtiene la URL para la autorización del usuario Monex.
    # @param authorization Header para token
    # @param pre_monex_authorization Información para la autorización
    # @param [Hash] opts the optional parameters
    # @return [Array<(TokenRequiredResponse, Fixnum, Hash)>] TokenRequiredResponse data, response status code and response headers
    def create_authorization_with_http_info(authorization, pre_monex_authorization, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContractsDetailsApi.create_authorization ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ContractsDetailsApi.create_authorization"
      end
      # verify the required parameter 'pre_monex_authorization' is set
      if @api_client.config.client_side_validation && pre_monex_authorization.nil?
        fail ArgumentError, "Missing the required parameter 'pre_monex_authorization' when calling ContractsDetailsApi.create_authorization"
      end
      # resource path
      local_var_path = '/onboarding/accounts/authorize'

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
      post_body = @api_client.object_to_http_body(pre_monex_authorization)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TokenRequiredResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContractsDetailsApi#create_authorization\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Obtiene los usuarios autorizados
    # Obtienen los detalles de los usuarios autorizados de Monex.
    # @param authorization Header para token
    # @param x_access_key La llave de acceso de la aplicación
    # @param request_id El identificador de la petición a esta API
    # @param [Hash] opts the optional parameters
    # @return [Array<AuthorizedUsers>]
    def obtain_authorized_users(authorization, x_access_key, request_id, opts = {})
      data, _status_code, _headers = obtain_authorized_users_with_http_info(authorization, x_access_key, request_id, opts)
      data
    end

    # Obtiene los usuarios autorizados
    # Obtienen los detalles de los usuarios autorizados de Monex.
    # @param authorization Header para token
    # @param x_access_key La llave de acceso de la aplicación
    # @param request_id El identificador de la petición a esta API
    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<AuthorizedUsers>, Fixnum, Hash)>] Array<AuthorizedUsers> data, response status code and response headers
    def obtain_authorized_users_with_http_info(authorization, x_access_key, request_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContractsDetailsApi.obtain_authorized_users ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ContractsDetailsApi.obtain_authorized_users"
      end
      # verify the required parameter 'x_access_key' is set
      if @api_client.config.client_side_validation && x_access_key.nil?
        fail ArgumentError, "Missing the required parameter 'x_access_key' when calling ContractsDetailsApi.obtain_authorized_users"
      end
      # verify the required parameter 'request_id' is set
      if @api_client.config.client_side_validation && request_id.nil?
        fail ArgumentError, "Missing the required parameter 'request_id' when calling ContractsDetailsApi.obtain_authorized_users"
      end
      if @api_client.config.client_side_validation && request_id.to_s.length > 36
        fail ArgumentError, 'invalid value for "request_id" when calling ContractsDetailsApi.obtain_authorized_users, the character length must be smaller than or equal to 36.'
      end

      if @api_client.config.client_side_validation && request_id.to_s.length < 36
        fail ArgumentError, 'invalid value for "request_id" when calling ContractsDetailsApi.obtain_authorized_users, the character length must be great than or equal to 36.'
      end

      if @api_client.config.client_side_validation && request_id !~ Regexp.new(/[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/)
        fail ArgumentError, "invalid value for 'request_id' when calling ContractsDetailsApi.obtain_authorized_users, must conform to the pattern /[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[34][A-Fa-f0-9]{3}-[89ab][A-Fa-f0-9]{3}-[A-Fa-f0-9]{12}$/."
      end

      # resource path
      local_var_path = '/onboarding/accounts/{requestId}/authorized-users'.sub('{' + 'requestId' + '}', request_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Authorization'] = authorization
      header_params[:'X-ACCESS-KEY'] = x_access_key

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
        :return_type => 'Array<AuthorizedUsers>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContractsDetailsApi#obtain_authorized_users\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Obtiene los usuarios autorizados por contrato
    # Obtienen los detalles de los usuarios autorizados por contrato Monex.
    # @param authorization Header para token
    # @param x_access_key La llave de acceso de la aplicación
    # @param [Hash] opts the optional parameters
    # @option opts [String] :contract El contrato Monex
    # @return [Array<AuthorizedUsers>]
    def obtain_authorized_users_by_contract(authorization, x_access_key, opts = {})
      data, _status_code, _headers = obtain_authorized_users_by_contract_with_http_info(authorization, x_access_key, opts)
      data
    end

    # Obtiene los usuarios autorizados por contrato
    # Obtienen los detalles de los usuarios autorizados por contrato Monex.
    # @param authorization Header para token
    # @param x_access_key La llave de acceso de la aplicación
    # @param [Hash] opts the optional parameters
    # @option opts [String] :contract El contrato Monex
    # @return [Array<(Array<AuthorizedUsers>, Fixnum, Hash)>] Array<AuthorizedUsers> data, response status code and response headers
    def obtain_authorized_users_by_contract_with_http_info(authorization, x_access_key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContractsDetailsApi.obtain_authorized_users_by_contract ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ContractsDetailsApi.obtain_authorized_users_by_contract"
      end
      # verify the required parameter 'x_access_key' is set
      if @api_client.config.client_side_validation && x_access_key.nil?
        fail ArgumentError, "Missing the required parameter 'x_access_key' when calling ContractsDetailsApi.obtain_authorized_users_by_contract"
      end
      if @api_client.config.client_side_validation && !opts[:'contract'].nil? && opts[:'contract'].to_s.length > 11
        fail ArgumentError, 'invalid value for "opts[:"contract"]" when calling ContractsDetailsApi.obtain_authorized_users_by_contract, the character length must be smaller than or equal to 11.'
      end

      if @api_client.config.client_side_validation && !opts[:'contract'].nil? && opts[:'contract'].to_s.length < 1
        fail ArgumentError, 'invalid value for "opts[:"contract"]" when calling ContractsDetailsApi.obtain_authorized_users_by_contract, the character length must be great than or equal to 1.'
      end

      # resource path
      local_var_path = '/onboarding/accounts/authorized-users'

      # query parameters
      query_params = {}
      query_params[:'contract'] = opts[:'contract'] if !opts[:'contract'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      header_params[:'Authorization'] = authorization
      header_params[:'X-ACCESS-KEY'] = x_access_key

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
        :return_type => 'Array<AuthorizedUsers>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContractsDetailsApi#obtain_authorized_users_by_contract\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Obtiene los detalles de la empresa del contrato
    # Detalles de la compañía relacionada con el contrato de Monex.
    # @param authorization Header para token
    # @param x_access_key La llave de acceso de la aplicación
    # @param contract_detail_request Información para obtener los detalles de la companía
    # @param [Hash] opts the optional parameters
    # @return [ContractDetailResponse]
    def obtain_contract_details(authorization, x_access_key, contract_detail_request, opts = {})
      data, _status_code, _headers = obtain_contract_details_with_http_info(authorization, x_access_key, contract_detail_request, opts)
      data
    end

    # Obtiene los detalles de la empresa del contrato
    # Detalles de la compañía relacionada con el contrato de Monex.
    # @param authorization Header para token
    # @param x_access_key La llave de acceso de la aplicación
    # @param contract_detail_request Información para obtener los detalles de la companía
    # @param [Hash] opts the optional parameters
    # @return [Array<(ContractDetailResponse, Fixnum, Hash)>] ContractDetailResponse data, response status code and response headers
    def obtain_contract_details_with_http_info(authorization, x_access_key, contract_detail_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ContractsDetailsApi.obtain_contract_details ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ContractsDetailsApi.obtain_contract_details"
      end
      # verify the required parameter 'x_access_key' is set
      if @api_client.config.client_side_validation && x_access_key.nil?
        fail ArgumentError, "Missing the required parameter 'x_access_key' when calling ContractsDetailsApi.obtain_contract_details"
      end
      # verify the required parameter 'contract_detail_request' is set
      if @api_client.config.client_side_validation && contract_detail_request.nil?
        fail ArgumentError, "Missing the required parameter 'contract_detail_request' when calling ContractsDetailsApi.obtain_contract_details"
      end
      # resource path
      local_var_path = '/onboarding/accounts/details'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])
      header_params[:'Authorization'] = authorization
      header_params[:'X-ACCESS-KEY'] = x_access_key

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(contract_detail_request)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ContractDetailResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ContractsDetailsApi#obtain_contract_details\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
