#!/usr/bin/env ruby
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

Fecha de creación: 01 de september, 2020
author: Juan Mandujano
version: 1.0
=end

require 'test/unit'
require 'wire4_auth/auth/oauth_wire4'
require 'wire4_auth/webhook_verification_signature/utils_compute'
require 'wire4_client'

#noinspection RubyTooManyMethodsInspection
class Wire4ExamplesTest < Test::Unit::TestCase

  CLIENT_ID = "6PqWzT6DgbEyLNu7d4YItJyuT2Ea"

  CLIENT_SECRET = "00cRaDHZimyDENOJOQbA5psoVNoa"

  USER_KEY = "9548042dccc4790a43c36d919fb677@develop.wire4.mx"

  SECRET_KEY = "e9c24e4aa064a34bd6357400fab7c0"

  SUBSCRIPTION = "73be6d4e-fa70-4732-8eab-a47b2b798a83"

  def test_given_bad_credentials_should_raise_error
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID,'CLIENT_SECRET',Wire4Auth::EnvironmentEnum::DEVELOPMENT)
    oauth_wire4.config_default_api_client
    puts "Calling token creation..."
    assert_raise( Wire4Client::ApiError){oauth_wire4.obtain_access_token_app('general')}
  end

  def test_given_valid_credentials_should_return_token
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID,CLIENT_SECRET,Wire4Auth::EnvironmentEnum::DEVELOPMENT)
    oauth_wire4.config_default_api_client
    puts "Calling token creation..."
    token = oauth_wire4.obtain_access_token_app('general')
    assert_not_nil(token, 'the token should not be nil')
  end

  def test_same_credentials_should_return_same_token
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID,CLIENT_SECRET,Wire4Auth::EnvironmentEnum::DEVELOPMENT)
    oauth_wire4.config_default_api_client
    puts "Calling token creation..."
    token = oauth_wire4.obtain_access_token_app('general')
    second_token = oauth_wire4.obtain_access_token_app('general')
    assert_equal(token, second_token, 'the tokens should be equals')
  end

  def test_different_scopes_for_same_user_should_return_different_tokens
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID,CLIENT_SECRET,Wire4Auth::EnvironmentEnum::DEVELOPMENT)
    oauth_wire4.config_default_api_client
    puts "Calling token creation..."
    general_token = oauth_wire4.obtain_access_token_app('general')
    spei_admin_token = oauth_wire4.obtain_access_token_app('spei_admin')
    spid_admin_token = oauth_wire4.obtain_access_token_app('spid_admin')
    codi_general_token = oauth_wire4.obtain_access_token_app('codi_general')
    codi_report_token = oauth_wire4.obtain_access_token_app('codi_report')
    double_token = oauth_wire4.obtain_access_token_app('spei_admin codi_report')
    assert_not_equal(general_token, spei_admin_token, 'the tokens should not be equals')
    assert_not_equal(general_token, spid_admin_token, 'the tokens should not be equals')
    assert_not_equal(general_token, codi_general_token, 'the tokens should not be equals')
    assert_not_equal(general_token, codi_report_token, 'the tokens should not be equals')
    assert_not_equal(general_token, double_token, 'the tokens should not be equals')
    assert_not_equal(spei_admin_token, spid_admin_token, 'the tokens should not be equals')
    assert_not_equal(codi_general_token, codi_report_token, 'the tokens should not be equals')
    assert_not_equal(double_token, codi_report_token, 'the tokens should not be equals')
    assert_not_equal(double_token, codi_general_token, 'the tokens should not be equals')
  end

  def test_given_many_tokens_for_same_user_should_keeps_in_cache
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID,CLIENT_SECRET,Wire4Auth::EnvironmentEnum::DEVELOPMENT)
    oauth_wire4.config_default_api_client
    puts "Calling token creation..."
    general_token = oauth_wire4.obtain_access_token_app('general')
    spei_admin_token = oauth_wire4.obtain_access_token_app('spei_admin')
    spid_admin_token = oauth_wire4.obtain_access_token_app('spid_admin')
    codi_general_token = oauth_wire4.obtain_access_token_app('codi_general')
    codi_report_token = oauth_wire4.obtain_access_token_app('codi_report')
    double_token = oauth_wire4.obtain_access_token_app('spei_admin codi_report')
    general_token_second = oauth_wire4.obtain_access_token_app('general')
    spei_admin_token_second = oauth_wire4.obtain_access_token_app('spei_admin')
    spid_admin_token_second = oauth_wire4.obtain_access_token_app('spid_admin')
    codi_general_token_second = oauth_wire4.obtain_access_token_app('codi_general')
    codi_report_token_second = oauth_wire4.obtain_access_token_app('codi_report')
    double_token_second = oauth_wire4.obtain_access_token_app('spei_admin codi_report')
    assert_equal(general_token, general_token_second, 'the tokens should be equals')
    assert_equal(spei_admin_token, spei_admin_token_second, 'the tokens should be equals')
    assert_equal(spid_admin_token, spid_admin_token_second, 'the tokens should be equals')
    assert_equal(codi_general_token, codi_general_token_second, 'the tokens should be equals')
    assert_equal(codi_report_token, codi_report_token_second, 'the tokens should be equals')
    assert_equal(double_token, double_token_second, 'the tokens should be equals')
  end

  def test_when_regenerate_token_should_replace_old_token
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID,CLIENT_SECRET,Wire4Auth::EnvironmentEnum::DEVELOPMENT)
    oauth_wire4.config_default_api_client
    puts "Calling token creation..."
    general_token = oauth_wire4.obtain_access_token_app('general')
    spei_admin_token = oauth_wire4.obtain_access_token_app('spei_admin')
    spid_admin_token = oauth_wire4.obtain_access_token_app('spid_admin')
    codi_general_token = oauth_wire4.obtain_access_token_app('codi_general')
    codi_report_token = oauth_wire4.obtain_access_token_app('codi_report')
    double_token = oauth_wire4.obtain_access_token_app('general codi_report')
    puts "#{double_token}"
    general_token_second = oauth_wire4.regenerate_access_token_app('general')
    spei_admin_token_second = oauth_wire4.regenerate_access_token_app('spei_admin')
    spid_admin_token_second = oauth_wire4.regenerate_access_token_app('spid_admin')
    codi_general_token_second = oauth_wire4.regenerate_access_token_app('codi_general')
    codi_report_token_second = oauth_wire4.regenerate_access_token_app('codi_report')
    double_token_second = oauth_wire4.regenerate_access_token_app('general codi_report')
    assert_not_equal(general_token, general_token_second, 'the tokens should not be equals')
    assert_not_equal(spei_admin_token, spei_admin_token_second, 'the tokens should not be equals')
    assert_not_equal(spid_admin_token, spid_admin_token_second, 'the tokens should not be equals')
    assert_not_equal(codi_general_token, codi_general_token_second, 'the tokens should not be equals')
    assert_not_equal(codi_report_token, codi_report_token_second, 'the tokens should not be equals')
    assert_not_equal(double_token, double_token_second, 'the tokens should not be equals')
  end

  def test_given_bad_user_credentials_should_raise_error
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID,CLIENT_SECRET,Wire4Auth::EnvironmentEnum::DEVELOPMENT)
    oauth_wire4.config_default_api_client
    puts "Calling token creation..."
    assert_raise( Wire4Client::ApiError){oauth_wire4.obtain_access_token_app_user(USER_KEY, 'SECRET_KEY','spei_admin')}
  end

  def test_given_valid_user_credentials_should_return_token
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID,CLIENT_SECRET,Wire4Auth::EnvironmentEnum::DEVELOPMENT)
    oauth_wire4.config_default_api_client
    puts "Calling token creation..."
    token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spei_admin')
    assert_not_nil(token, 'the token should not be nil')
  end

  def test_same_user_credentials_should_return_same_token
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID,CLIENT_SECRET,Wire4Auth::EnvironmentEnum::DEVELOPMENT)
    oauth_wire4.config_default_api_client
    puts "Calling token creation..."
    token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spei_admin')
    second_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spei_admin')
    assert_equal(token, second_token, 'the tokens should be equals')
  end

  def test_different_scopes_for_same_user_credentials_should_return_different_tokens
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID,CLIENT_SECRET,Wire4Auth::EnvironmentEnum::DEVELOPMENT)
    oauth_wire4.config_default_api_client
    puts "Calling token creation..."

    spei_admin_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spei_admin')
    spid_admin_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spid_admin')
    codi_general_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'codi_general')
    codi_report_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'codi_report')
    double_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spei_admin, codi_report')
    assert_not_equal(spei_admin_token, spid_admin_token, 'the tokens should not be equals')
    assert_not_equal(spei_admin_token, codi_general_token, 'the tokens should not be equals')
    assert_not_equal(spei_admin_token, codi_report_token, 'the tokens should not be equals')
    assert_not_equal(spei_admin_token, double_token, 'the tokens should not be equals')
    assert_not_equal(spid_admin_token, double_token, 'the tokens should not be equals')
    assert_not_equal(spid_admin_token, codi_report_token, 'the tokens should not be equals')
    assert_not_equal(codi_general_token, codi_report_token, 'the tokens should not be equals')
    assert_not_equal(double_token, codi_report_token, 'the tokens should not be equals')
    assert_not_equal(double_token, codi_general_token, 'the tokens should not be equals')
  end

  def test_given_many_tokens_for_same_user_credentials_should_keeps_in_cache
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID,CLIENT_SECRET,Wire4Auth::EnvironmentEnum::DEVELOPMENT)
    oauth_wire4.config_default_api_client
    puts "Calling token creation..."

    spei_admin_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spei_admin')
    spid_admin_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spid_admin')
    codi_general_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'codi_general')
    codi_report_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'codi_report')
    double_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spei_admin, codi_report')
    spei_admin_token_second = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spei_admin')
    spid_admin_token_second = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spid_admin')
    codi_general_token_second = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'codi_general')
    codi_report_token_second = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'codi_report')
    double_token_second = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spei_admin, codi_report')
    assert_equal(spei_admin_token, spei_admin_token_second, 'the tokens should be equals')
    assert_equal(spid_admin_token, spid_admin_token_second, 'the tokens should be equals')
    assert_equal(codi_general_token, codi_general_token_second, 'the tokens should be equals')
    assert_equal(codi_report_token, codi_report_token_second, 'the tokens should be equals')
    assert_equal(double_token, double_token_second, 'the tokens should be equals')

  end

  def test_when_regenerate_user_token_should_replace_old_token
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID,CLIENT_SECRET,Wire4Auth::EnvironmentEnum::DEVELOPMENT)
    oauth_wire4.config_default_api_client
    puts "Calling token creation..."

    spei_admin_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spei_admin')
    spid_admin_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spid_admin')
    codi_general_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'codi_general')
    codi_report_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'codi_report')
    double_token = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY,'spei_admin, codi_report')
    spei_admin_token_second = oauth_wire4.regenerate_access_token_app_user(USER_KEY, SECRET_KEY,'spei_admin')
    spid_admin_token_second = oauth_wire4.regenerate_access_token_app_user(USER_KEY, SECRET_KEY,'spid_admin')
    codi_general_token_second = oauth_wire4.regenerate_access_token_app_user(USER_KEY, SECRET_KEY,'codi_general')
    codi_report_token_second = oauth_wire4.regenerate_access_token_app_user(USER_KEY, SECRET_KEY,'codi_report')
    double_token_second = oauth_wire4.regenerate_access_token_app_user(USER_KEY, SECRET_KEY,'spei_admin, codi_report')
    assert_not_equal(spei_admin_token, spei_admin_token_second, 'the tokens should not be equals')
    assert_not_equal(spid_admin_token, spid_admin_token_second, 'the tokens should not be equals')
    assert_not_equal(codi_general_token, codi_general_token_second, 'the tokens should not be equals')
    assert_not_equal(codi_report_token, codi_report_token_second, 'the tokens should not be equals')
    assert_not_equal(double_token, double_token_second, 'the tokens should not be equals')
  end

end
