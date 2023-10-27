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
=end

require 'test/unit'
require 'wire4_auth/auth/oauth_wire4'
require 'wire4_auth/webhook_verification_signature/utils_compute'
require 'wire4_client'

#noinspection RubyTooManyMethodsInspection
class Wire4ExamplesTest < Test::Unit::TestCase

  ENVIRONMENT = Wire4Auth::EnvironmentEnum::SANDBOX

  CLIENT_ID = "FxUWmqYGZuv8O1qjxstvIyJothMa"

  CLIENT_SECRET = "kjwbkrPVgXsnaUGzthj55dsFhx4a"

  USER_KEY = "071e2b59b354186b3a0158de493536@sandbox.wire4.mx"

  SECRET_KEY = "0d1e33e94604f01b4e00d2fcb6b48f"

  SUBSCRIPTION = "f1504fea-3a8f-475a-a50a-90d3c40efc59"


  def test_send_contact
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::ContactoApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    body = Wire4Client::ContactRequest.new
    body.address = "Calle Falsa 123, Col Fantasía"
    body.company = "Compu Mundo Hiper Mega Red"
    body.contact_person = "Homer J Simpson"
    body.email = "homer.simpson@compumundohipermegared.com"
    body.phone_number = "4422102030"

    begin
      # Call the API
      response = api_instance.send_contact_using_post_with_http_info(authorization, body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end
  end

  def test_obtain_cep
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::ComprobanteElectrnicoDePagoCEPApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    cep_data = Wire4Client::CepSearchBanxico.new # CepSearchBanxico | Información para buscar un CEP
    cep_data.amount = 8963.25
    cep_data.beneficiary_account = '072680004657656853'
    cep_data.beneficiary_bank_key = '40072'
    cep_data.clave_rastreo = '58735618'
    cep_data.operation_date = '05-12-2018'
    cep_data.reference = '1122334'
    cep_data.sender_account = '112680000156896531'
    cep_data.sender_bank_key = '40112'

    begin
      # Call the API
      response = api_instance.obtain_transaction_cep_using_post(authorization, cep_data)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_make_pre_subscription
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::SuscripcionesApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    body = Wire4Client::PreEnrollmentData.new
    body.cancel_return_url = "https://your-app-url.mx/return"
    body.return_url = "https://your-app-url.mx/cancel"

    begin
      # Call the API
      response = api_instance.pre_enrollment_monex_user_using_post(authorization, body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_delete_pre_subscription
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::SuscripcionesApi.new

    # build body with info (check references for more info, types, required fields)
    subscription = "55af515a-43ec-4537-96a4-489d1deef127"

    begin
      # Call the API
      response = api_instance.remove_subscription_pending_status_using_delete_with_http_info(authorization, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyLocalVariableNamingConvention
  def test_delete_subscription
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)
    subscription_to_remove_user_key = "e7446202e95421dbb3c1b914e15c74@sandbox.wire4.mx"
    subscription_to_remove_user_secret = "8617fa525ca4140b545b66c5adcbb1"

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(subscription_to_remove_user_key,
                                                               subscription_to_remove_user_secret, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::SuscripcionesApi.new

    # build body with info (check references for more info, types, required fields)
    subscription = "5873240b-cf69-456a-ab5a-88f5e79ab4b8"

    begin
      # Call the API
      response = api_instance.remove_enrollment_user_using_delete_with_http_info(authorization, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_change_subscription_usage
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')

    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::SuscripcionesApi.new

    subscription_id = "5873240b-cf69-456a-ab5a-88f5e79ab4b8"
    request = Wire4Client::ServiceBanking.new
    request.spei=Wire4Client::UseServiceBanking.new(status:'ACTIVE', use:'WITHDRAWAL')
    request.spid=Wire4Client::UseServiceBanking.new(status:'INACTIVE', use:'WITHDRAWAL_DEPOSIT')
    begin
      # Call the API
      response = api_instance.change_subscription_use_using_patch(authorization, request ,subscription_id)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end


  def test_change_subscription_status_using_put
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::SuscripcionesApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    request = Wire4Client::SubscriptionChangeStatusRequest.new # CepSearchBanxico | Información para buscar un CEP
    request.status = 'INACTIVE'


    begin
      # Call the API
      response = api_instance.change_subscription_status_using_put_with_http_info(authorization, request, SUBSCRIPTION)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_obtain_relationships
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

    # build body with info (check references for more info, types, required fields)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.get_available_relationships_monex_using_get(authorization, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_pre_register_beneficiaries
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION
    body = Wire4Client::AccountRequest.new
    body.return_url = "https://your-app-url.mx/return"
    body.cancel_return_url = "https://your-app-url.mx/cancel"
    account = Wire4Client::Account.new
    account.amount_limit = 10000.00
    account.beneficiary_account = "112680000156896531"
    account.email = ["beneficiary@wire4.mx"]
    account.kind_of_relationship = "RECURRENTE"
    account.numeric_reference_spei = "1234567"
    account.payment_concept_spei = "concept spei"
    person = Wire4Client::Person.new
    person.last_name = "Simpson"
    person.middle_name = "Jay"
    person.name = "Bartolomeo"
    account.person = person
    account.relationship = "ACREEDOR"
    account.rfc = "SJBA920125AB1"
    body.accounts = [account]

    begin
      # Call the API
      response = api_instance.pre_register_accounts_using_post(authorization, body, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_remove_beneficiaries_pending
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION
    request_id = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.remove_beneficiaries_pending_using_delete_with_http_info(authorization, request_id, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_obtain_beneficiaries
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      # response = api_instance.get_beneficiaries_for_account_using_get(subscription, rfc: "RFCE010980AR3")
      # response = api_instance.get_beneficiaries_for_account_using_get(subscription, account: "RFCE010980AR3")
      # response = api_instance.get_beneficiaries_for_account_using_get(subscription, rfc: "RFCE010980AR3, account: "RFCE010980AR3")
      response = api_instance.get_beneficiaries_for_account_using_get(authorization, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_obtain_beneficiaries_by_request_id
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION
    request_id = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.get_beneficiaries_by_request_id(authorization, request_id, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_change_amount_limit_beneficiary
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION
    account = "112680000156896531"
    body = Wire4Client::AmountRequest.new
    body.amount_limit = 20000.00
    body.currency_code = "MXP"
    body.previous_amount_limit = 10000.00
    body.return_url = "https://your-app-url.mx/return"
    body.cancel_return_url = "https://your-app-url.mx/cancel"

    begin
      # Call the API
      response = api_instance.update_amount_limit_account_using_put_with_http_info(authorization, account, body, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_delete_beneficiary
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION
    account = "112680000156896531"

    begin
      # Call the API
      response = api_instance.delete_account_using_delete_with_http_info(authorization, account, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_obtain_institutions
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::InstitucionesApi.new

    begin
      # Call the API
      response = api_instance.get_all_institutions_using_get(authorization)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_obtain_balance
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::SaldoApi.new

    # build body with info (check references for more info, types, required fields)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.get_balance_using_get(authorization, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_obtain_SPID_classifications
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spid_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spid_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::TransferenciasSPIDApi.new

    # build body with info (check references for more info, types, required fields)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.get_spid_classifications_using_get(authorization, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_pre_register_beneficiaries_SPID
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION
    body = Wire4Client::AccountRequest.new
    body.return_url = "https://your-app-url.mx/return"
    body.cancel_return_url = "https://your-app-url.mx/cancel"
    account = Wire4Client::Account.new
    account.amount_limit = 10000.00
    account.beneficiary_account = "112680000156896531"
    account.email = ["beneficiary@wire4.mx"]
    account.kind_of_relationship = "RECURRENTE"
    account.numeric_reference_spei = "1234567"
    account.payment_concept_spei = "concept spei"
    person = Wire4Client::Person.new
    person.last_name = "Simpson"
    person.middle_name = "Jay"
    person.name = "Bartolomeo"
    account.person = person
    account.relationship = "ACREEDOR"
    account.rfc = "SJBA920125AB1"
    body.accounts = [account]

    begin
      # Call the API
      response = api_instance.pre_register_accounts_using_post(authorization, body, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_obtain_beneficiaries_spid
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spid_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CuentasDeBeneficiariosSPIDApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      # response = api_instance.get_beneficiaries_for_account_using_get(subscription, rfc: "RFCE010980AR3")
      # response = api_instance.get_beneficiaries_for_account_using_get(subscription, account: "RFCE010980AR3")
      # response = api_instance.get_beneficiaries_for_account_using_get(subscription, rfc: "RFCE010980AR3, account: "RFCE010980AR3")
      response = api_instance.get_spid_beneficiaries_for_account(authorization, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end


  def test_pre_register_spid_accounts_using_post
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spid_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spid_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CuentasDeBeneficiariosSPIDApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION
    body = Wire4Client::AccountSpid.new
    body.return_url = "https://your-app-url.mx/return"
    body.cancel_return_url = "https://your-app-url.mx/cancel"
    body.amount_limit = 10000.00
    body.beneficiary_account = "112680000156896531"
    body.email = ["beneficiary.spid@wire4.mx"]
    body.institution = Wire4Client::BeneficiaryInstitution.new(name: "Compu Mundo Hiper Mega Red")
    body.kind_of_relationship = "RECURRENTE"
    body.numeric_reference = "1234567"
    body.payment_concept = "concept spei"
    body.relationship = "ACREEDOR"
    body.rfc = "SJBA920125AB1"

    begin
      # Call the API
      response = api_instance.pre_register_accounts_using_post1(authorization, body, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_get_depositants_totals
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::DepositantesApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.get_depositants_totals_using_get(authorization, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_get_depositants
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::DepositantesApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.get_depositants_using_get(authorization, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_register_depositants
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::DepositantesApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION
    body = Wire4Client::DepositantsRegister.new
    body._alias = "Depositant 0292921"
    body.currency_code = "MXP"
    body.email = ["depositant@wire4.mx"]
    body.name = "Marge Bouvier"

    begin
      # Call the API
      response = api_instance.register_depositants_using_post(authorization, body, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_incoming_SPEI_transactions_report
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::TransferenciasSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      # Filtering by date is optional, but both parameters must be present when use filter by date:
      # begin date, end date,
      # Format: 'yyyy-MM-dd'
      initDate = nil
      finalDate = nil
      response = api_instance.incoming_spei_transactions_report_using_get(authorization, subscription, {:begin_date => initDate, :end_date => finalDate})

      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_outgoing_SPEI_transactions_report
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::TransferenciasSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.outgoing_spei_transactions_report_using_get(authorization, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_out_comming_spei_request_id_transactions_report_using_get
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::TransferenciasSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION
    request_id = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.out_comming_spei_request_id_transactions_report_using_get(authorization, request_id, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling TransferenciasSPEIApi->out_comming_spei_request_id_transactions_report_using_get: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_register_outgoing_SPEI_transaction
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::TransferenciasSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION
    body = Wire4Client::TransactionsOutgoingRegister.new
    body.return_url = "https://your-app-url.mx/return"
    body.cancel_return_url = "https://your-app-url.mx/cancel"
    transaction = Wire4Client::TransactionOutgoing.new
    transaction.order_id = "137f14a4-9e12-4a98-bbd1-ab347753e68a"
    transaction.amount = 1259.69
    transaction.beneficiary_account = "112680000156896531"
    transaction.currency_code = "MXP"
    transaction.email = ["notificar@wire4.mx"]
    transaction.reference = 1234567
    transaction.concept = "Transfer out test 1"
    body.transactions = [transaction]

    begin
      # Call the API
      response = api_instance.register_outgoing_spei_transaction_using_post(authorization, subscription, body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_delete_outgoing_pending_SPEI_transaction
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::TransferenciasSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION
    request_id = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.drop_transactions_pending_using_delete_with_http_info(authorization, request_id, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_register_outgoing_SPID_transaction
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spid_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spid_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::TransferenciasSPIDApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION
    body = Wire4Client::TransactionOutgoingSpid.new
    body.return_url = "https://your-app-url.mx/return"
    body.cancel_return_url = "https://your-app-url.mx/cancel"
    body.amount = 1259.69
    body.beneficiary_account = "112680000156896531"
    body.classification_id = "01"
    body.currency_code = "USD"
    body.email = ["notificar@wire4.mx"]
    body.numeric_reference_spid = 1234567
    body.order_id = "77baa78f-be22-4f6a-b79e-60b20a198324"
    body.payment_concept_spid = "Transfer out test 1"

    begin
      # Call the API
      response = api_instance.register_outgoing_spid_transaction_using_post(authorization, subscription, body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_register_web_hook
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::WebhooksApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    body = Wire4Client::WebhookRequest.new # CepSearchBanxico | Información para buscar un CEP
    body.events = %w(ACCOUNT.CREATED TRANSACTION.OUTGOING.RECEIVED ENROLLMENT.CREATED)
    body.name = "RUBY TEST SDK WEBHOOK-REGISTER"
    body.url = "https://your-web-hook-url.mx"

    begin
      # Call the API
      response = api_instance.register_webhook(authorization, body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_get_web_hooks
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::WebhooksApi.new

    begin
      # Call the API
      response = api_instance.get_webhooks(authorization)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
end
  end

  def test_get_web_hook_by_id
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::WebhooksApi.new

    begin
      # Call the API
      response = api_instance.get_webhook(authorization, "wh_3fe3e5f4849f4cabb147804fd55c86fc")
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_get_facturas
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX

    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::FacturasApi.new

    begin
      # Call the API
      response = api_instance.billings_report_using_get(authorization, period: "2019-10")
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_get_facturas_by_id
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX

    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::FacturasApi.new

    begin
      # Call the API
      response = api_instance.billings_report_by_id_using_get(authorization, "834BA74A-BBBB-43C4-8400-A4528153C2BD")
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_check_web_hook_sign

    omit('Reason')
    puts `cd .. && cd .. && find *`.split("\n").uniq.sort.select { |f| !f.empty? }

    payload = "{ \"responseCode\":0, \n" + \
              "  \"message\":\"Ya existe este beneficiario de pago a ctas nacionales en el contrato\",\n" + \
              "  \"statusCode\":\"ERROR\",\n" + \
              "  \"externalReference\":\"8939TR\"\n" + \
              "}"
    expected_key = "8e63e88434679473bdb28546d7d91537601f4588e801972376d5c5addcb8fd706e6c92421b73151de3c1945ce000a8a" + \
                 +"5aa1d5cc3cdd73f2769ee9980db420db9"

    result = Wire4Auth::UtilsCompute.compare_webhook_msg_signatures(payload, "9ie93030?=", expected_key)
    puts "WebHook signature verification, correct:  #{result}"

    assert result
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_authorize_accounts_pending
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

    # build body with info (check references for more info, types, required fields)
    subscription = SUBSCRIPTION
    body = Wire4Client::UrlsRedirect.new
    body.cancel_return_url = "https://your-app-url.mx/return"
    body.return_url = "https://your-app-url.mx/cancel"

    begin
      # Call the API
      response = api_instance.authorize_accounts_pending_put(authorization, subscription, body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_create_authorization_transactions_group
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::TransferenciasSPEIApi.new

    # build body with info (check references for more info, types, required fields)
    subscription = SUBSCRIPTION
    body = Wire4Client::AuthorizationTransactionGroup.new
    body.transactions = ["2454ffb2-a699-408f-9812-9a12eed11bfc"]  # Add N transactions order identifiers

    body.redirect_urls = Wire4Client::UrlsRedirect.new
    body.redirect_urls.cancel_return_url = "https://your-app-url.mx/return"
    body.redirect_urls.return_url = "https://your-app-url.mx/cancel"

    begin
      # Call the API
      response = api_instance.create_authorization_transactions_group(authorization, subscription, body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_register_company_using
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "codi_general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('codi_general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::EmpresasCoDiApi.new

    # build body with info (check references for more info, types, required fields)
    body = Wire4Client::CompanyRequested.new
    body.business_name = "Tacos"
    body.comercial_name = "Tacos el Compa"
    body.rfc = "TACO580926LA1"
    body.certificate = Wire4Client::CertificateRequest.new
    body.certificate.certificate_number = "4908439084390849084"
    body.certificate._alias = "00040390904903904909"
    body.certificate.check_digit = "1"
    body.certificate.cipher_data = "4309jij3490j43jf0j3490fFFFDSDS4393490"

    begin
      # Call the API
      response = api_instance.register_company_using_post(authorization, body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_obtain_companies
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "codi_general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('codi_general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::EmpresasCoDiApi.new

    begin
      # Call the API
      response = api_instance.obtain_companies(authorization)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  COMPANY_ID = "0b43cbd2-2a86-4eb5-a51c-49a53d521295"

  def test_create_sales_point
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('codi_general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::PuntosDeVentaCoDiApi.new

    # build body with info (check references for more info, types, required fields)
    company_id = COMPANY_ID
    body = Wire4Client::SalesPointRequest.new
    body.name = "Taqueria Sur, caja 1"
    body.access_ip = "189.180.255.229"
    body.notifications_url = "https://webhook.site/3e32e1c4-1346-4f5a-92d5-2a921c5c85df"
    body.account = "044680035044988526"

    begin
      # Call the API
      response = api_instance.create_sales_point(authorization, company_id, body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_obtain_sale_points
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "codi_general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('codi_general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::PuntosDeVentaCoDiApi.new

    # build body with info (check references for more info, types, required fields)
    company_id = COMPANY_ID

    begin
      # Call the API
      response = api_instance.obtain_sale_points(authorization, company_id)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  SALES_POINT_ID = "465ffc2c-10b5-4475-8d64-bc58e4ff098d"
  SALES_POINT_KEY = "097db4157b74619b88f40550e7c1ee@develop.wire4.mx"
  SALES_POINT_SECRET = "b722b8c8fc24d4bae0b1cd41b4c6af"

  def test_generate_codi_code_qr
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "codi_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(SALES_POINT_KEY, SALES_POINT_SECRET, 'codi_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::PeticionesDePagoPorCoDiApi.new

    # build body with info (check references for more info, types, required fields)
    sales_point_id = SALES_POINT_ID
    body = Wire4Client::CodiCodeRequestDTO.new
    body.amount = 178.8
    body.concept = "consumo saintiago"
    body.order_id = "b4408b4d-17a0-4d39-85f2-f3da1e2825e9"
    body.due_date = "2020-08-25T13:45:00"
    body.type = "QR_CODE"

    begin
      # Call the API
      response = api_instance.generate_codi_code_qr(authorization, body, sales_point_id)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  ORDER_ID = "b4408b4d-17a0-4d39-85f2-f3da1e2825e9"

  #noinspection RubyInstanceMethodNamingConvention
  def test_consult_codi_request_by_order_id
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "codi_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(SALES_POINT_KEY, SALES_POINT_SECRET, 'codi_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::PeticionesDePagoPorCoDiApi.new

    # build body with info (check references for more info, types, required fields)
    sales_point_id = SALES_POINT_ID # Sales point identifier
    order_id = ORDER_ID # Order identifier

    begin
      # Call the API
      response = api_instance.consult_codi_request_by_order_id(authorization, order_id, sales_point_id)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_consult_codi_operations
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "codi_report" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(SALES_POINT_KEY, SALES_POINT_SECRET, 'codi_report')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::OperacionesCoDiApi.new

    # build body with info (check references for more info, types, required fields)
    company_id = COMPANY_ID # Company identifier
    sales_point_id = SALES_POINT_ID # Sales point identifier

    body = Wire4Client::CodiOperationsFiltersRequestDTO.new
    # All filters options are optional
    # order_id,
    # operation_date_from, operation_date_to,
    # request_date_from, request_date_to,
    # status (RECEIVED, COMPLETED, CANCELLED),
    # amount_from, amount_to
    body.order_id = ORDER_ID

    begin
      # Call the API
      # consult_codi_operations(authorization, company_id: company_id, sales_point_id: sales_point_id,
      #                                                 page: "0", size: "20")
      # With filters:
      # consult_codi_operations(authorization, company_id: company_id, sales_point_id: sales_point_id,
      #                                                 page: "0", size: "20", request_filters: body)
      response = api_instance.consult_codi_operations(authorization, company_id: company_id, sales_point_id: sales_point_id,
                                                      page: "0", size: "20", request_filters: body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  ACCESS_KEY = "AccessK3y!" #"YOUR_ACCESS_KEY_HERE"
  def test_obtain_contract_details
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::ContractsDetailsApi.new

    # build body with info (check references for more info, types, required fields)
    x_access_key = ACCESS_KEY
    body = Wire4Client::ContractDetailRequest.new
    body.contract = "1234567"
    body.user_name = "amolina"
    body.password = "whatever"
    body.token_code = "258963"

    begin
      # Call the API
      response = api_instance.obtain_contract_details(authorization, x_access_key, body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_create_authorization
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::ContractsDetailsApi.new

    # build body with info (check references for more info, types, required fields)
    body = Wire4Client::PreMonexAuthorization.new
    body.return_url = "https://your-app-url.mx/return"
    body.cancel_return_url = "https://your-app-url.mx/cancel"
    body.rfc = "TACO890101LO0"
    body.business_name = "Compa Tacos"

    begin
      # Call the API
      response = api_instance.create_authorization(authorization, body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  REQUEST_ID = "17fa79db-759f-4105-bc47-688fed75ddac"

  def test_obtain_authorized_users
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::ContractsDetailsApi.new

    # build body with info (check references for more info, types, required fields)
    x_access_key = ACCESS_KEY; # This ACCESS_KEY is provider from Wire4, contact support
    request_id = REQUEST_ID

    begin
      # Call the API
      response = api_instance.obtain_authorized_users(authorization, x_access_key, request_id)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_obtain_configurations_limits
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::LmitesDeMontosApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.obtain_configurations_limits(authorization, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_update_configurations_with_http_info
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app_user(USER_KEY,
                                                               SECRET_KEY, 'spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::LmitesDeMontosApi.new

    # build body with info (check references for more info, types, required fields)
    configurations = Wire4Client::ConfigurationsLimits.new(group:'LIMIT_BY_TIME',items:[Wire4Client::Item.new(key:'BY_AMOUNT',value:'15000.00'),
                                                                      Wire4Client::Item.new(key:'BY_OPERATION',value:'100')])
    body = Wire4Client::UpdateConfigurationsRequestDTO.new
    body.configurations=[configurations]


    begin
      # Call the API
      response = api_instance.update_configurations_with_http_info( authorization,  SUBSCRIPTION, body)
      puts response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_obtain_payment_request_by_order_id
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::ReporteDeSolicitudesDePagosApi.new

    opts = {
      order_id: 'order_id_example' # String | Numero de orden de la solicitud de pago.
    }

    begin
      # Call the API
      response = api_instance.payment_request_id_report_by_order_id_using_get(authorization, opts)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_obtain_payment_request_by_request_id
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::ReporteDeSolicitudesDePagosApi.new

    request_id = 'order_id_example' # String | Numero de orden de la solicitud de pago.

    begin
      # Call the API
      response = api_instance.payment_request_id_report_using_get(authorization, request_id)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_create_payment_request_method_card
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::SolicitudDePagosApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    payment_data = Wire4Client::PaymentRequestReq.new
    customer_data = Wire4Client::Customer.new

    order_id = 'order_id_example' # String | Numero de orden de la solicitud de pago.

    customer_data.name = 'name test'
    customer_data.email = 'email test'

    payment_data.customer = customer_data
    payment_data.description = 'description'
    payment_data.due_date = '2023-11-21'
    payment_data.amount = 8963.25
    payment_data.order_id = order_id
    payment_data.cancel_return_url = 'https://wire4.mx'
    payment_data.return_url = 'https://wire4.mx'
    payment_data.method = 'CARD'


    begin
      # Call the API
      response = api_instance.register_payment_request_using_post(authorization, payment_data)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_create_payment_request_method_spei
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::SolicitudDePagosApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    payment_data = Wire4Client::PaymentRequestReq.new
    customer_data = Wire4Client::Customer.new

    order_id = 'order_id_example' # String | Numero de orden de la solicitud de pago.

    customer_data.name = 'name test'
    customer_data.email = 'email test'

    payment_data.customer = customer_data
    payment_data.description = 'description'
    payment_data.due_date = '2023-10-21'
    payment_data.amount = 8963.25
    payment_data.order_id = order_id
    payment_data.method = 'SPEI'
    payment_data.depositant_account = '112680000176543217'
    payment_data.type = 'ONE_OCCASION'


    begin
      # Call the API
      response = api_instance.register_payment_request_using_post(authorization, payment_data)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_create_recurring_charge
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('charges_general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CargosRecurrentesApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    payment_data = Wire4Client::RecurringChargeRequest.new
    customer_data = Wire4Client::Customer.new
    product_data = Wire4Client::Product.new

    order_id = 'order_id_example' # String | Numero de orden de la solicitud de pago.

    customer_data.name = 'name test'
    customer_data.email = 'email test'

    product_data.name = 'name test'
    product_data.amount = 2
    product_data.billing_period = 'WEEKLY'
    product_data.frequency = 1

    payment_data.customer = customer_data
    payment_data.product = product_data
    payment_data.first_charge_date = '2022-12-23T00:00:00.000-06:00'
    payment_data.charges = 5
    payment_data.charges = order_id
    payment_data.cancel_return_url = 'https://wire4.mx'
    payment_data.return_url = 'https://wire4.mx'



    begin
      # Call the API
      response = api_instance.register_recurring_charge_using_post(authorization, payment_data)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_delete_recurring_charge
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('charges_general')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CargosRecurrentesApi.new

    order_id = 'order_id_example' # String | Numero de orden de los cargos recurrentes.

    begin
      # Call the API
      response = api_instance.delete_recurring_charge_using_delete(authorization, order_id)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_deposit_authorization
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::AutorizacinDeDepsitosApi.new

    subscription = '19b341dd-88b0-49a2-9997-117f553d15cd' # String | Numero de subscripcion.

    begin
      # Call the API
      response = api_instance.get_deposit_auth_configurations(authorization, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

  def test_enable_disable_deposit_authorization
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, ENVIRONMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client
      authorization = oauth_wire4.obtain_access_token_app('spei_admin')
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e.response_body}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::AutorizacinDeDepsitosApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    deposit_data = Wire4Client::DepositAuthorizationRequest.new
    webhook_data = Wire4Client::WebHookDepositAuthorizationRequest.new

    webhook_data.name = 'mio'
    webhook_data.url = 'https://tu-url-de-webhook'

    deposit_data.enabled = true
    deposit_data.wh_uuid = 'wh_30bfe7b213ea49bca4a29cc7793dda41'
    deposit_data.webhook = webhook_data


    subscription = '19b341dd-88b0-49a2-9997-117f553d15cd' # String | Numero de subscripcion.

    begin
      # Call the API
      response = api_instance.put_deposit_auth_configurations(deposit_data, authorization, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e.response_body}"
      # Optional manage exception in call API
      return
    end
  end

end
