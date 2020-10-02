=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

# Common files
require 'wire4_client/api_client'
require 'wire4_client/api_error'
require 'wire4_client/version'
require 'wire4_client/configuration'

# Models
require 'wire4_client/models/account'
require 'wire4_client/models/account_detail'
require 'wire4_client/models/account_reassigned'
require 'wire4_client/models/account_request'
require 'wire4_client/models/account_response'
require 'wire4_client/models/account_spid'
require 'wire4_client/models/address_company'
require 'wire4_client/models/amount_request'
require 'wire4_client/models/authorization_transaction_group'
require 'wire4_client/models/authorized_beneficiaries_response'
require 'wire4_client/models/authorized_users'
require 'wire4_client/models/balance'
require 'wire4_client/models/balance_list_response'
require 'wire4_client/models/beneficiaries_query_register_status'
require 'wire4_client/models/beneficiaries_response'
require 'wire4_client/models/beneficiary_institution'
require 'wire4_client/models/billing'
require 'wire4_client/models/billing_transaction'
require 'wire4_client/models/cep_response'
require 'wire4_client/models/cep_search_banxico'
require 'wire4_client/models/certificate_request'
require 'wire4_client/models/codi_code_qr_response_dto'
require 'wire4_client/models/codi_code_request_dto'
require 'wire4_client/models/codi_operation_response_dto'
require 'wire4_client/models/codi_operations_filters_request_dto'
require 'wire4_client/models/company_registered'
require 'wire4_client/models/company_requested'
require 'wire4_client/models/compay'
require 'wire4_client/models/configurations_limits'
require 'wire4_client/models/contact_request'
require 'wire4_client/models/contract_detail_request'
require 'wire4_client/models/contract_detail_response'
require 'wire4_client/models/deposit'
require 'wire4_client/models/depositant'
require 'wire4_client/models/depositants_register'
require 'wire4_client/models/depositants_response'
require 'wire4_client/models/error_response'
require 'wire4_client/models/get_depositants'
require 'wire4_client/models/institution'
require 'wire4_client/models/institutions_list'
require 'wire4_client/models/item'
require 'wire4_client/models/message_account_beneficiary'
require 'wire4_client/models/message_cep'
require 'wire4_client/models/message_codi_action'
require 'wire4_client/models/message_configurations_limits'
require 'wire4_client/models/message_deposit_received'
require 'wire4_client/models/message_institution'
require 'wire4_client/models/message_payment'
require 'wire4_client/models/message_payment_state_pending'
require 'wire4_client/models/message_request_changed'
require 'wire4_client/models/message_sales_point'
require 'wire4_client/models/message_subscription'
require 'wire4_client/models/message_user_authorized'
require 'wire4_client/models/message_web_hook'
require 'wire4_client/models/operations'
require 'wire4_client/models/pager_response_dto'
require 'wire4_client/models/payment'
require 'wire4_client/models/payment_request_codi_response_dto'
require 'wire4_client/models/payments_request_id'
require 'wire4_client/models/person'
require 'wire4_client/models/pre_enrollment_data'
require 'wire4_client/models/pre_enrollment_response'
require 'wire4_client/models/pre_monex_authorization'
require 'wire4_client/models/relationship'
require 'wire4_client/models/relationships_response'
require 'wire4_client/models/sales_point'
require 'wire4_client/models/sales_point_found'
require 'wire4_client/models/sales_point_request'
require 'wire4_client/models/sales_point_respose'
require 'wire4_client/models/spid_beneficiaries_response'
require 'wire4_client/models/spid_beneficiary_response'
require 'wire4_client/models/spid_classification_dto'
require 'wire4_client/models/spid_classifications_response_dto'
require 'wire4_client/models/timestamp'
require 'wire4_client/models/token_required_response'
require 'wire4_client/models/transaction_outgoing'
require 'wire4_client/models/transaction_outgoing_spid'
require 'wire4_client/models/transactions_outgoing_register'
require 'wire4_client/models/update_configurations_request_dto'
require 'wire4_client/models/urls_redirect'
require 'wire4_client/models/user_company'
require 'wire4_client/models/webhook'
require 'wire4_client/models/webhook_request'
require 'wire4_client/models/webhook_response'
require 'wire4_client/models/webhooks_list'

# APIs
require 'wire4_client/api/comprobante_electrnico_de_pago_cep_api'
require 'wire4_client/api/contacto_api'
require 'wire4_client/api/contracts_details_api'
require 'wire4_client/api/cuentas_de_beneficiarios_spei_api'
require 'wire4_client/api/cuentas_de_beneficiarios_spid_api'
require 'wire4_client/api/depositantes_api'
require 'wire4_client/api/empresas_co_di_api'
require 'wire4_client/api/facturas_api'
require 'wire4_client/api/instituciones_api'
require 'wire4_client/api/lmites_de_montos_api'
require 'wire4_client/api/operaciones_co_di_api'
require 'wire4_client/api/peticiones_de_pago_por_co_di_api'
require 'wire4_client/api/puntos_de_venta_co_di_api'
require 'wire4_client/api/saldo_api'
require 'wire4_client/api/suscripciones_api'
require 'wire4_client/api/transferencias_spei_api'
require 'wire4_client/api/transferencias_spid_api'
require 'wire4_client/api/webhooks_api'

module Wire4Client
  class << self
    # Customize default settings for the SDK using block.
    #   Wire4Client.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
