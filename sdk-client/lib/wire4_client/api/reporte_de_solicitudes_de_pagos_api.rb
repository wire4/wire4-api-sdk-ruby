=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'uri'

module Wire4Client
  class ReporteDeSolicitudesDePagosApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Consulta de solicitudes de pago por numero de orden.
    # @param authorization Header para token
    # @param [Hash] opts the optional parameters
    # @option opts [String] :order_id Es el identificador de la orden a buscar.
    # @return [PaymentRequestReportDTO]
    def payment_request_id_report_by_order_id_using_get(authorization, opts = {})
      data, _status_code, _headers = payment_request_id_report_by_order_id_using_get_with_http_info(authorization, opts)
      data
    end

    # Consulta de solicitudes de pago por numero de orden.
    # @param authorization Header para token
    # @param [Hash] opts the optional parameters
    # @option opts [String] :order_id Es el identificador de la orden a buscar.
    # @return [Array<(PaymentRequestReportDTO, Fixnum, Hash)>] PaymentRequestReportDTO data, response status code and response headers
    def payment_request_id_report_by_order_id_using_get_with_http_info(authorization, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ReporteDeSolicitudesDePagosApi.payment_request_id_report_by_order_id_using_get ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ReporteDeSolicitudesDePagosApi.payment_request_id_report_by_order_id_using_get"
      end
      # resource path
      local_var_path = '/payment-request'

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
        :return_type => 'PaymentRequestReportDTO')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReporteDeSolicitudesDePagosApi#payment_request_id_report_by_order_id_using_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Consulta de solicitudes de pago por identificador de petición
    # @param authorization Header para token
    # @param request_id Identificador de la petición a buscar.
    # @param [Hash] opts the optional parameters
    # @return [PaymentRequestReportDTO]
    def payment_request_id_report_using_get(authorization, request_id, opts = {})
      data, _status_code, _headers = payment_request_id_report_using_get_with_http_info(authorization, request_id, opts)
      data
    end

    # Consulta de solicitudes de pago por identificador de petición
    # @param authorization Header para token
    # @param request_id Identificador de la petición a buscar.
    # @param [Hash] opts the optional parameters
    # @return [Array<(PaymentRequestReportDTO, Fixnum, Hash)>] PaymentRequestReportDTO data, response status code and response headers
    def payment_request_id_report_using_get_with_http_info(authorization, request_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ReporteDeSolicitudesDePagosApi.payment_request_id_report_using_get ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ReporteDeSolicitudesDePagosApi.payment_request_id_report_using_get"
      end
      # verify the required parameter 'request_id' is set
      if @api_client.config.client_side_validation && request_id.nil?
        fail ArgumentError, "Missing the required parameter 'request_id' when calling ReporteDeSolicitudesDePagosApi.payment_request_id_report_using_get"
      end
      # resource path
      local_var_path = '/payment-request/{requestId}'.sub('{' + 'requestId' + '}', request_id.to_s)

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
        :return_type => 'PaymentRequestReportDTO')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReporteDeSolicitudesDePagosApi#payment_request_id_report_using_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
