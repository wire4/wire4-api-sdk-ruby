=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'uri'

module Wire4Client
  class ComprobanteElectrnicoDePagoCEPApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Consulta de CEP
    # Consulta el CEP de un pago realizado a través del SPEI, si es que este se encuentra disponible en BANXICO.
    # @param authorization Header para token
    # @param cep_data Información para buscar un CEP
    # @param [Hash] opts the optional parameters
    # @return [CepResponse]
    def obtain_transaction_cep_using_post(authorization, cep_data, opts = {})
      data, _status_code, _headers = obtain_transaction_cep_using_post_with_http_info(authorization, cep_data, opts)
      data
    end

    # Consulta de CEP
    # Consulta el CEP de un pago realizado a través del SPEI, si es que este se encuentra disponible en BANXICO.
    # @param authorization Header para token
    # @param cep_data Información para buscar un CEP
    # @param [Hash] opts the optional parameters
    # @return [Array<(CepResponse, Fixnum, Hash)>] CepResponse data, response status code and response headers
    def obtain_transaction_cep_using_post_with_http_info(authorization, cep_data, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ComprobanteElectrnicoDePagoCEPApi.obtain_transaction_cep_using_post ...'
      end
      # verify the required parameter 'authorization' is set
      if @api_client.config.client_side_validation && authorization.nil?
        fail ArgumentError, "Missing the required parameter 'authorization' when calling ComprobanteElectrnicoDePagoCEPApi.obtain_transaction_cep_using_post"
      end
      # verify the required parameter 'cep_data' is set
      if @api_client.config.client_side_validation && cep_data.nil?
        fail ArgumentError, "Missing the required parameter 'cep_data' when calling ComprobanteElectrnicoDePagoCEPApi.obtain_transaction_cep_using_post"
      end
      # resource path
      local_var_path = '/ceps'

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
      post_body = @api_client.object_to_http_body(cep_data)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'CepResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ComprobanteElectrnicoDePagoCEPApi#obtain_transaction_cep_using_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
