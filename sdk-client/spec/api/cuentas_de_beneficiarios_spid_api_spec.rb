=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'spec_helper'
require 'json'

# Unit tests for Wire4Client::CuentasDeBeneficiariosSPIDApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'CuentasDeBeneficiariosSPIDApi' do
  before do
    # run before each test
    @instance = Wire4Client::CuentasDeBeneficiariosSPIDApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of CuentasDeBeneficiariosSPIDApi' do
    it 'should create an instance of CuentasDeBeneficiariosSPIDApi' do
      expect(@instance).to be_instance_of(Wire4Client::CuentasDeBeneficiariosSPIDApi)
    end
  end

  # unit tests for get_spid_beneficiaries_for_account
  # Consulta los beneficiarios SPID registrados
  # Obtiene los beneficiarios SPID registrados al contrato relacionado con la suscripción. Los beneficiarios son los que actualmente se encuentran registrados en banca Monex.
  # @param authorization Header para token
  # @param subscription Es el identificador de la suscripción a esta API.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :account Cuenta del beneficiario, puede ser CLABE (18 dígitos), Tarjeta de débito  (TDD, 16 dígitos) o número de celular (10 dígitos).
  # @option opts [String] :beneficiary_bank Es la clave del banco beneficiario. Se puede obtener del catalogo de &lt;a href&#x3D;\&quot;#operation/getAllInstitutionsUsingGET\&quot;&gt;instituciones.&lt;/a&gt;
  # @option opts [String] :beneficiary_name Es el nombre del beneficiario.
  # @option opts [String] :end_date Es la fecha de inicio del periodo a filtrar en formato dd-mm-yyyy.
  # @option opts [String] :init_date Es la fecha de inicio del periodo a filtrar en formato dd-mm-yyyy.
  # @option opts [String] :page Es el número de página.
  # @option opts [String] :rfc Es el Registro Federal de Contribuyentes (RFC) del beneficiario.
  # @option opts [String] :size Es el tamaño de página.
  # @option opts [String] :status Es el estado (estatus) de la cuenta, Los valores pueden ser &lt;b&gt;PENDING&lt;/b&gt; y &lt;b&gt;REGISTERED&lt;/b&gt;.
  # @return [SpidBeneficiariesResponse]
  describe 'get_spid_beneficiaries_for_account test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for pre_register_accounts_using_post1
  # Pre-registro de cuentas de beneficiarios SPID®
  # Pre-registra una o más cuentas de beneficiario SPID® en la plataforma de Wire4, ésta le proporcionaará una URL donde lo llevará al centro de autorización para que el cuentahabiente Monex ingrese su llave digital para confirmar el alta de las cuentas de beneficiarios.&lt;br/&gt; Los posibles valores de &lt;em&gt;relationship&lt;/em&gt; y &lt;em&gt;kind_of_relationship&lt;/em&gt; se deben  obtener de &lt;a href&#x3D;\&quot;#operation/getAvailableRelationshipsMonexUsingGET\&quot;&gt;/subscriptions/{subscription}/beneficiaries/relationships.&lt;/a&gt;&lt;br/&gt;&lt;br/&gt;La confirmación de registro en Monex se realizará a través de una notificación a los webhooks registrados con el evento de tipo &lt;a href&#x3D;\&quot;#section/Eventos/Tipos-de-Eventos\&quot;&gt;ACCOUNT.CREATED.&lt;/a&gt;
  # @param authorization Header para token
  # @param request_spid_dto Información de la cuenta del beneficiario
  # @param subscription Es el identificador de la suscripción a esta API.
  # @param [Hash] opts the optional parameters
  # @return [TokenRequiredResponse]
  describe 'pre_register_accounts_using_post1 test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
