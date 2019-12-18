=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'uri'

module Wire4Client
  class FacturasApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Consulta de facturas por identificador
    # Consulta las facturas emitidas por conceptos de uso de la plataforma y operaciones realizadas tanto de entrada como de salida. Se debe especificar el identificador de la factura
    # @param id Identificador de la factura
    # @param [Hash] opts the optional parameters
    # @return [Billing]
    def billings_report_by_id_using_get(id, opts = {})
      data, _status_code, _headers = billings_report_by_id_using_get_with_http_info(id, opts)
      data
    end

    # Consulta de facturas por identificador
    # Consulta las facturas emitidas por conceptos de uso de la plataforma y operaciones realizadas tanto de entrada como de salida. Se debe especificar el identificador de la factura
    # @param id Identificador de la factura
    # @param [Hash] opts the optional parameters
    # @return [Array<(Billing, Fixnum, Hash)>] Billing data, response status code and response headers
    def billings_report_by_id_using_get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FacturasApi.billings_report_by_id_using_get ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling FacturasApi.billings_report_by_id_using_get"
      end
      # resource path
      local_var_path = '/billings/{id}'.sub('{' + 'id' + '}', id.to_s)

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
      auth_names = ['wire4_aut_app']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Billing')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FacturasApi#billings_report_by_id_using_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Consulta de facturas
    # Consulta las facturas emitidas por conceptos de uso de la plataforma y operaciones realizadas tanto de entrada como de salida. Es posible filtrar por periodo de fecha yyyy-MM, por ejemplo 2019-11
    # @param [Hash] opts the optional parameters
    # @option opts [String] :period Filtro de fecha yyyy-MM
    # @return [Array<Billing>]
    def billings_report_using_get(opts = {})
      data, _status_code, _headers = billings_report_using_get_with_http_info(opts)
      data
    end

    # Consulta de facturas
    # Consulta las facturas emitidas por conceptos de uso de la plataforma y operaciones realizadas tanto de entrada como de salida. Es posible filtrar por periodo de fecha yyyy-MM, por ejemplo 2019-11
    # @param [Hash] opts the optional parameters
    # @option opts [String] :period Filtro de fecha yyyy-MM
    # @return [Array<(Array<Billing>, Fixnum, Hash)>] Array<Billing> data, response status code and response headers
    def billings_report_using_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FacturasApi.billings_report_using_get ...'
      end
      # resource path
      local_var_path = '/billings'

      # query parameters
      query_params = {}
      query_params[:'period'] = opts[:'period'] if !opts[:'period'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['wire4_aut_app']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Array<Billing>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FacturasApi#billings_report_using_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
