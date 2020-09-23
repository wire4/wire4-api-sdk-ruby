# -*- encoding: utf-8 -*-

#    COPYRIGHT © 2017. TCPIP.
#    PATENT PENDING. ALL RIGHTS RESERVED.
#    SPEI GATEWAY IS REGISTERED TRADEMARKS OF TCPIP.
#
#    This software is confidential and proprietary information of TCPIP.
#    You shall not disclose such Confidential Information and shall use it only
#    in accordance with the company policy.

=begin
#Wire4Auth

Fecha de creación: 11 de diciembre, 2019
author: Saintiago García
version: 1.0
=end

module Wire4Auth
  class EnvironmentEnum

    attr_reader :token_url

    attr_reader :service_url

    attr_reader :base_path

    def initialize(token_url, service_url, base_path)
      @token_url = token_url
      @service_url = service_url
      @base_path = base_path
    end

    SANDBOX = new('https://sandbox-api.wire4.mx/token', 'sandbox-api.wire4.mx', '/wire4/1.0.0')

    DEVELOPMENT = new('https://development-api.wire4.mx/token', 'development-api.wire4.mx', '/wire4/1.0.0')

    PRODUCTION = new('https://api.wire4.mx/token', 'api.wire4.mx', '/wire4/1.0.0')

    class << self
      private :new
    end
  end
end

