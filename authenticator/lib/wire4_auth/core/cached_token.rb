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

Fecha de creación: 13 de diciembre, 2019
author: Saintiago García
version: 1.0
=end

require 'oauth2'

module Wire4Auth
  class CachedToken
    attr_reader :user_key

    attr_reader :user_secret

    attr_accessor :access_token

    def initialize(user_key, user_secret, access_token)

      raise 'Not OAuth2::AccessToken class instance' unless access_token.nil? or access_token.is_a? OAuth2::AccessToken

      @user_key = user_key
      @user_secret = user_secret
      @access_token = access_token
    end
  end
end