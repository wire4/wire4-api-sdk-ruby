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

require 'oauth2'
require 'wire4_client'
require 'wire4_auth/core/cached_token'
require 'wire4_auth/core/environment_enum'

module Wire4Auth
  class OAuthWire4

    MAX_APP_USER_SIZE_CACHED = 100

    # accessor get method
    attr_reader :client_id

    # accessor get method
    attr_reader :client_secret

    # accessor get method
    attr_reader :environment

    def initialize(client_id, client_secret, environment)

      raise 'Not EnvironmentEnum class instance' unless environment.is_a? Wire4Auth::EnvironmentEnum

      @client_id = client_id
      @client_secret = client_secret
      @environment = environment

      @token_cached_app = Wire4Auth::CachedToken.new(nil, nil, nil)
      @tokens_cached_app_user = {}
    end

    #noinspection DuplicatedCode
    def obtain_access_token_app(scope = "general")
      key_search = @client_id + scope
      token_cached = @tokens_cached_app_user[key_search]
      if !token_cached.nil? and !token_cached.access_token.nil? and !token_cached.access_token.params.nil? and
          !token_cached.access_token.params['scope'].nil?  and !token_cached.access_token.expires_at.nil? and
          token_cached.access_token.expires_at.is_a? Integer and is_valid(token_cached.access_token.expires_at) and
           !token_cached.access_token.token.nil?

        return format_to_header(token_cached.access_token.token)
      end

      begin
        client = OAuth2::Client.new(@client_id, @client_secret, :token_url => @environment.token_url)
        access_token = client.get_token({ :grant_type => "client_credentials", :scope => scope})

        if @tokens_cached_app_user.length + 1 > MAX_APP_USER_SIZE_CACHED
          @tokens_cached_app_user.each_key do |key|
            @tokens_cached_app_user.delete(key)
            break
          end
        end

        @tokens_cached_app_user[key_search] = Wire4Auth::CachedToken.new(@client_id, @client_secret, access_token)

        return format_to_header(access_token.token)
      rescue OAuth2::Error => e
        raise Wire4Client::ApiError.new(:code => e.code,
                           :message => e.description)
      end

    end

    #noinspection DuplicatedCode
    def obtain_access_token_app_user(user_key, secret_key, scope = "spei_admin")

      key_search = user_key + scope
      token_cached = @tokens_cached_app_user[key_search]
      if !token_cached.nil? and !token_cached.access_token.nil? and !token_cached.access_token.params.nil? and
          !token_cached.access_token.params['scope'].nil? and !token_cached.access_token.expires_at.nil? and
          token_cached.access_token.expires_at.is_a? Integer and is_valid(token_cached.access_token.expires_at) and
          !token_cached.access_token.token.nil?

        return format_to_header(token_cached.access_token.token)
      end

      begin
        client = OAuth2::Client.new(@client_id, @client_secret, :token_url => @environment.token_url)
        access_token = client.get_token({ :grant_type => "password", :scope => scope,
                                                  :username => user_key, :password => secret_key })

        if @tokens_cached_app_user.length + 1 > MAX_APP_USER_SIZE_CACHED
          @tokens_cached_app_user.each_key do |key|
            @tokens_cached_app_user.delete(key)
            break
          end
        end

        @tokens_cached_app_user[key_search] = Wire4Auth::CachedToken.new(user_key, secret_key, access_token)

        return format_to_header(access_token.token)
      rescue OAuth2::Error => e
        raise Wire4Client::ApiError.new(:code => e.code,
                           :message => e.description)
      end
    end

    def regenerate_access_token_app(scope = "general")

      begin
        client = OAuth2::Client.new(@client_id, @client_secret, :token_url => @environment.token_url)
        access_token = client.get_token({ :grant_type => "client_credentials", :scope => scope})

        key_search = @client_id + scope
        token_cached = @tokens_cached_app_user[key_search]
        if token_cached.nil? and @tokens_cached_app_user.length + 1 > MAX_APP_USER_SIZE_CACHED
          @tokens_cached_app_user.each_key do |key|
            @tokens_cached_app_user.delete(key)
            break
          end
        end

        @tokens_cached_app_user[key_search] = Wire4Auth::CachedToken.new(@client_id, @client_secret, access_token)

        return format_to_header(access_token.token)
      rescue OAuth2::Error => e
        raise Wire4Client::ApiError.new(:code => e.code,
                                        :message => e.description)
      end

    end

    #noinspection RubyInstanceMethodNamingConvention
    def regenerate_access_token_app_user(user_key, secret_key, scope = "spei_admin")

      begin
        client = OAuth2::Client.new(@client_id, @client_secret, :token_url => @environment.token_url)
        access_token = client.get_token({ :grant_type => "password", :scope => scope,
                                          :username => user_key, :password => secret_key })

        key_search = user_key + scope
        token_cached = @tokens_cached_app_user[key_search]
        if token_cached.nil? and @tokens_cached_app_user.length + 1 > MAX_APP_USER_SIZE_CACHED
          @tokens_cached_app_user.each_key do |key|
            @tokens_cached_app_user.delete(key)
            break
          end
        end

        @tokens_cached_app_user[key_search] = Wire4Auth::CachedToken.new(user_key, secret_key, access_token)

        return format_to_header(access_token.token)
      rescue OAuth2::Error => e
        raise Wire4Client::ApiError.new(:code => e.code,
                                        :message => e.description)
      end
    end

    def config_default_api_client
      # Setup authorization
      Wire4Client.configure do |config|
        # Configure OAuth2 access token for authorization
        config.host = @environment.service_url
        config.base_path = @environment.base_path
      end
    end

    private

    def is_valid(expires_at)

      time = Time.at(expires_at)
      # Get current time using the time zone
      now = Time.now + 5 * 60 # plus 5 minutes

      time > now
    end

    def format_to_header(token)

      "Bearer " + token
    end
  end
end
