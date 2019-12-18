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

Fecha de creación: 11 de diciembre, 2019
author: Saintiago García
version: 1.0
=end

require 'test/unit'
require 'wire4_auth/auth/oauth_wire4'
require 'wire4_auth/webhook_verification_signature/utils_compute'
require 'wire4_client'

class Wire4ExamplesTest < Test::Unit::TestCase

  CLIENT_ID = "FxUWmqYGZuv8O1qjxstvIyJothMa"

  CLIENT_SECRET = "kjwbkrPVgXsnaUGzthj55dsFhx4a"

  USER_KEY = "071e2b59b354186b3a0158de493536@sandbox.wire4.mx"

  SECRET_KEY = "0d1e33e94604f01b4e00d2fcb6b48f"

  SUBSCRIPTION = "f1504fea-3a8f-475a-a50a-90d3c40efc59"

  def test_send_contact
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app('general'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
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
      response = api_instance.send_contact_using_post_with_http_info(body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end
  end

  def test_obtain_cep
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app('general'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
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
      response = api_instance.obtain_transaction_cep_using_post(cep_data)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_make_pre_subscription
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app('general'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
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
      response = api_instance.pre_enrollment_monex_user_using_post(body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_delete_pre_subscription
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app('general'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::SuscripcionesApi.new

    # build body with info (check references for more info, types, required fields)
    subscription = "55af515a-43ec-4537-96a4-489d1deef127"

    begin
      # Call the API
      response = api_instance.remove_subscription_pending_status_using_delete_with_http_info(subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyLocalVariableNamingConvention
  def test_delete_subscription
    omit('Reason')
    subscription_to_remove_user_key = "e7446202e95421dbb3c1b914e15c74@sandbox.wire4.mx"
    subscription_to_remove_user_secret = "8617fa525ca4140b545b66c5adcbb1"

    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(subscription_to_remove_user_key,
                                                                                     subscription_to_remove_user_secret, 'spei_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::SuscripcionesApi.new

    # build body with info (check references for more info, types, required fields)
    subscription = "5873240b-cf69-456a-ab5a-88f5e79ab4b8"

    begin
      # Call the API
      response = api_instance.remove_enrollment_user_using_delete_with_http_info(subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_obtain_relationships
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

    # build body with info (check references for more info, types, required fields)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.get_available_relationships_monex_using_get(subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
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
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
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
      response = api_instance.pre_register_accounts_using_post(body, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_remove_beneficiaries_pending
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::CuentasDeBeneficiariosSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION
    request_id = "b782a20b-d92c-4fd9-a5cc-33a88e9b0a79"

    begin
      # Call the API
      response = api_instance.remove_beneficiaries_pending_using_delete_with_http_info(request_id, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_obtain_beneficiaries
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
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
      response = api_instance.get_beneficiaries_for_account_using_get(subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_change_amount_limit_beneficiary
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
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

    begin
      # Call the API
      response = api_instance.update_amount_limit_account_using_put_with_http_info(account, body, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_delete_beneficiary
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
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
      response = api_instance.delete_account_using_delete_with_http_info(account, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_obtain_institutions
    #omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app('general'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::InstitucionesApi.new

    begin
      # Call the API
      response = api_instance.get_all_institutions_using_get
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_obtain_balance
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::SaldoApi.new

    # build body with info (check references for more info, types, required fields)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.get_balance_using_get(subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_obtain_SPID_classifications
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spid_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spid_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::TransferenciasSPIDApi.new

    # build body with info (check references for more info, types, required fields)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.get_spid_classifications_using_get(subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_pre_register_beneficiaries_SPID
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spid_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spid_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
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
    body.institution = Wire4Client::BeneficiaryInstitution.new(name: "BMONEX")
    body.kind_of_relationship = "RECURRENTE"
    body.numeric_reference = "1234567"
    body.payment_concept = "concept spei"
    body.relationship = "ACREEDOR"
    body.rfc = "SJBA920125AB1"

    begin
      # Call the API
      response = api_instance.pre_register_accounts_using_post1(body, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_get_depositants
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::DepositantesApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.get_depositants_using_get(subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_register_depositants
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
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
      response = api_instance.register_depositants_using_post(body, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_incoming_SPEI_transactions_report
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::TransferenciasSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.incoming_spei_transactions_report_using_get(subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_outgoing_SPEI_transactions_report
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::TransferenciasSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION

    begin
      # Call the API
      response = api_instance.outgoing_spei_transactions_report_using_get(subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_register_outgoing_SPEI_transaction
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
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
      response = api_instance.register_outgoing_spei_transaction_using_post(subscription, body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_delete_outgoing_pending_SPEI_transaction
    #omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spei_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spei_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::TransferenciasSPEIApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    subscription = SUBSCRIPTION
    request_id = "8abc184f-c3ac-4abd-9045-a9b4a501f007"

    begin
      # Call the API
      response = api_instance.drop_transactions_pending_using_delete_with_http_info(request_id, subscription)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  #noinspection RubyInstanceMethodNamingConvention
  def test_register_outgoing_SPID_transaction
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "spid_admin" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app_user(USER_KEY, SECRET_KEY, 'spid_admin'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
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
      response = api_instance.register_outgoing_spid_transaction_using_post(subscription, body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_register_web_hook
    #omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app('general'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::WebhooksApi.new

    # build body with info (check references for more info: types, required fields, etc.)
    body = Wire4Client::WebhookRequest.new # CepSearchBanxico | Información para buscar un CEP
    body.events = %w(ACCOUNT.CREATED TRANSACTION.OUTGOING.RECEIVED ENROLLMENT.CREATED)
    body.name = "RUBY TEST SDK WEBHOOK-REGISTER"
    body.url = "https://www.webhook.site/39034a03-8faf-424e-bb4a-7c3fee2bbfd3"

    begin
      # Call the API
      response = api_instance.register_webhook(body)
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_get_web_hooks
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app('general'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::WebhooksApi.new

    begin
      # Call the API
      response = api_instance.get_webhooks
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_get_web_hook_by_id
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX
    oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app('general'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::WebhooksApi.new

    begin
      # Call the API
      response = api_instance.get_webhook("wh_3fe3e5f4849f4cabb147804fd55c86fc")
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_get_facturas
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX

    #oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)
    oauth_wire4 = Wire4Auth::OAuthWire4.new("kIinyEIYWUIF3pflFxhRdKft2_ga",
                                            "gca6FwUE_9Dk23UhWoM81pZkNgEa", Wire4Auth::EnvironmentEnum::DEVELOPMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app('general'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::FacturasApi.new

    begin
      # Call the API
      response = api_instance.billings_report_using_get(period: "2019-10")
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_get_facturas_by_id
    omit('Reason')
    # Create the authenticator to obtain access token
    # The token URL and Service URL are defined for this environment enum value.
    # e.g. for Sandbox environment: Wire4Auth::EnvironmentEnum::SANDBOX

    #oauth_wire4 = Wire4Auth::OAuthWire4.new(CLIENT_ID, CLIENT_SECRET, Wire4Auth::EnvironmentEnum::SANDBOX)
    oauth_wire4 = Wire4Auth::OAuthWire4.new("kIinyEIYWUIF3pflFxhRdKft2_ga",
                                            "gca6FwUE_9Dk23UhWoM81pZkNgEa", Wire4Auth::EnvironmentEnum::DEVELOPMENT)

    begin
      # Obtain an access token use application flow and scope "general" and add to request
      oauth_wire4.config_default_api_client(oauth_wire4.obtain_access_token_app('general'))
    rescue Wire4Client::ApiError => e
      puts "Exception to obtain access token #{e}"
      # Optional manage exception in access token flow
      return
    end

    # create an instance of the API class
    api_instance = Wire4Client::FacturasApi.new

    begin
      # Call the API
      response = api_instance.billings_report_by_id_using_get("834BA74A-BBBB-43C4-8400-A4528153C2BD")
      p response
    rescue Wire4Client::ApiError => e
      puts "Exception when calling the API: #{e}"
      # Optional manage exception in call API
      return
    end
  end

  def test_check_web_hook_sign

    puts `cd .. && cd .. && find *`.split("\n").uniq.sort.select { |f| !f.empty? }

    omit('Reason')
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
end