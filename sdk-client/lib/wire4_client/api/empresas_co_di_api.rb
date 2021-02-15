=begin
#Wire4RestAPI

#Referencia de API. La API de Wire4 está organizada en torno a REST

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'uri'

module Wire4Client
  class EmpresasCoDiApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Consulta de empresas CODI®
    # Consulta de empresas CODI® registradas para la aplicación.
    # @param authorization Header para token
    # @param [Hash] opts the optional parameters
    # @return [Array<CompanyRegistered>]
    def obtain_companies(authorization, opts = {})
      data, _status_code, _headers = obtain_companies_with_http_info(authorization, opts)
      data
    end

    # Consulta de empresas CODI®
    # Consulta de empresas CODI® registradas para la aplicación.
    # @param authorization Header para token
    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<CompanyRegistered>, Fixnum, Hash)>] Array<CompanyRegistered> data, response status code and response headers
    def obtain_companies_with_http_info(authorization, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EmpresasCoDiApi.obtain_companies ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling EmpresasCoDiApi.obtain_companies"
      end
      # resource path
      local_var_path = '/codi/companies'

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
        :return_type => 'Array<CompanyRegistered>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EmpresasCoDiApi#obtain_companies\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Registro de empresas CODI®
    # Registra una empresa para hacer uso de operaciones CODI®.<br><br> <b>Nota:<b> Es requerido tener el certificado emitido por BANXICO® asi como el Nombre de la empresa, Nombre comercial y el Registro Federal de Contribuyentes (RFC) de la empresa.<br/>
    # @param authorization Header para token
    # @param request_dto Información de la cuenta del beneficiario
    # @param [Hash] opts the optional parameters
    # @return [CompanyRegistered]
    def register_company_using_post(authorization, request_dto, opts = {})
      data, _status_code, _headers = register_company_using_post_with_http_info(authorization, request_dto, opts)
      data
    end

    # Registro de empresas CODI®
    # Registra una empresa para hacer uso de operaciones CODI®.&lt;br&gt;&lt;br&gt; &lt;b&gt;Nota:&lt;b&gt; Es requerido tener el certificado emitido por BANXICO® asi como el Nombre de la empresa, Nombre comercial y el Registro Federal de Contribuyentes (RFC) de la empresa.&lt;br/&gt;
    # @param authorization Header para token
    # @param request_dto Información de la cuenta del beneficiario
    # @param [Hash] opts the optional parameters
    # @return [Array<(CompanyRegistered, Fixnum, Hash)>] CompanyRegistered data, response status code and response headers
    def register_company_using_post_with_http_info(authorization, request_dto, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: EmpresasCoDiApi.register_company_using_post ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling EmpresasCoDiApi.register_company_using_post"
      end
      # verify the required parameter 'request_dto' is set
      if @api_client.config.client_side_validation && request_dto.nil?
        fail ArgumentError, "Missing the required parameter 'request_dto' when calling EmpresasCoDiApi.register_company_using_post"
      end
      # resource path
      local_var_path = '/codi/companies'

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
        :return_type => 'CompanyRegistered')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: EmpresasCoDiApi#register_company_using_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
