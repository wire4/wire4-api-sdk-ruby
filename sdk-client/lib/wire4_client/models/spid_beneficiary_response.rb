=begin
#Wire4RestAPI

#Referencia de API. La API de Wire4 está organizada en torno a REST

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'date'

module Wire4Client
  # Objeto que contiene información de la cuenta de beneficiario SPID
  class SpidBeneficiaryResponse
    # Monto límite permitido para la cuenta. Ejemplo: 1000.00
    attr_accessor :amount_limit

    # El banco al cual pertenece la cuenta.
    attr_accessor :bank

    # Cuenta del beneficiario debe ser una cuenta CLABE. Ejemplo: 032180000118359719.
    attr_accessor :beneficiary_account

    # Lista de correos electrónicos (emails), este dato es opcional.
    attr_accessor :email

    # Objeto que contiene el nombre de la institución, es mutuamente exclusivo con el objeto Person
    attr_accessor :institution

    # Es el tipo de relación que se tiene con el propietario de la cuenta. Para registrar una cuenta, este valor se debe obtener del recurso <a href=\"#operation/getAvailableRelationshipsMonexUsingGET\"> relationships.</a> <br /><br /><b>Nota:</b> <em>Si en la respuesta de Monex esta propiedad es nula, tampoco estará presente en esta respuesta.</em>
    attr_accessor :kind_of_relationship

    # Referencia numérica.
    attr_accessor :numeric_reference_spid

    # Concepto de pago.
    attr_accessor :payment_concept_spid

    # La fecha en la que se registro el beneficiario.
    attr_accessor :register_date

    # Es la relación con el propietario de la cuenta, para registrar este valor se debe obtener del recurso <a href=\"#operation/getAvailableRelationshipsMonexUsingGET\">relationships.</a> <br/> <br/> <b>Nota:</b> Si en la respuesta de Monex, sta propiedad es nula, tampoco estará presente en esta respuesta.
    attr_accessor :relationship

    # Es el Registro federal de contribuyentes (RFC) de la persona o institución propietaria de la cuenta. <br/> <br/><b>Nota:</b> Se valida el formato de RFC.
    attr_accessor :rfc

    # El estado en el que se encuentra el registo del beneficiario.<br><br> Los valores pueden ser: <b>\"RECEIVED\", \"DELETED\", \"REQUEST_ERROR_BY_MONEX\", \"REQUESTED_TO_MONEX\", \"NOTIFIED_BY_MONEX\", \"NOTIFIED_BY_SPEIOK\", \"NOTIFIED_WITH_ERROR_BY_SPEIOK\" y \"PENDING\"</b>
    attr_accessor :status

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'amount_limit' => :'amount_limit',
        :'bank' => :'bank',
        :'beneficiary_account' => :'beneficiary_account',
        :'email' => :'email',
        :'institution' => :'institution',
        :'kind_of_relationship' => :'kind_of_relationship',
        :'numeric_reference_spid' => :'numeric_reference_spid',
        :'payment_concept_spid' => :'payment_concept_spid',
        :'register_date' => :'register_date',
        :'relationship' => :'relationship',
        :'rfc' => :'rfc',
        :'status' => :'status'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'amount_limit' => :'Float',
        :'bank' => :'Institution',
        :'beneficiary_account' => :'String',
        :'email' => :'Array<String>',
        :'institution' => :'BeneficiaryInstitution',
        :'kind_of_relationship' => :'String',
        :'numeric_reference_spid' => :'String',
        :'payment_concept_spid' => :'String',
        :'register_date' => :'DateTime',
        :'relationship' => :'String',
        :'rfc' => :'String',
        :'status' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'amount_limit')
        self.amount_limit = attributes[:'amount_limit']
      end

      if attributes.has_key?(:'bank')
        self.bank = attributes[:'bank']
      end

      if attributes.has_key?(:'beneficiary_account')
        self.beneficiary_account = attributes[:'beneficiary_account']
      end

      if attributes.has_key?(:'email')
        if (value = attributes[:'email']).is_a?(Array)
          self.email = value
        end
      end

      if attributes.has_key?(:'institution')
        self.institution = attributes[:'institution']
      end

      if attributes.has_key?(:'kind_of_relationship')
        self.kind_of_relationship = attributes[:'kind_of_relationship']
      end

      if attributes.has_key?(:'numeric_reference_spid')
        self.numeric_reference_spid = attributes[:'numeric_reference_spid']
      end

      if attributes.has_key?(:'payment_concept_spid')
        self.payment_concept_spid = attributes[:'payment_concept_spid']
      end

      if attributes.has_key?(:'register_date')
        self.register_date = attributes[:'register_date']
      end

      if attributes.has_key?(:'relationship')
        self.relationship = attributes[:'relationship']
      end

      if attributes.has_key?(:'rfc')
        self.rfc = attributes[:'rfc']
      end

      if attributes.has_key?(:'status')
        self.status = attributes[:'status']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @amount_limit.nil?
        invalid_properties.push('invalid value for "amount_limit", amount_limit cannot be nil.')
      end

      if @beneficiary_account.nil?
        invalid_properties.push('invalid value for "beneficiary_account", beneficiary_account cannot be nil.')
      end

      if @institution.nil?
        invalid_properties.push('invalid value for "institution", institution cannot be nil.')
      end

      if @kind_of_relationship.nil?
        invalid_properties.push('invalid value for "kind_of_relationship", kind_of_relationship cannot be nil.')
      end

      if !@numeric_reference_spid.nil? && @numeric_reference_spid.to_s.length > 7
        invalid_properties.push('invalid value for "numeric_reference_spid", the character length must be smaller than or equal to 7.')
      end

      if !@numeric_reference_spid.nil? && @numeric_reference_spid.to_s.length < 1
        invalid_properties.push('invalid value for "numeric_reference_spid", the character length must be great than or equal to 1.')
      end

      if !@numeric_reference_spid.nil? && @numeric_reference_spid !~ Regexp.new(/[0-9][0-9]*/)
        invalid_properties.push('invalid value for "numeric_reference_spid", must conform to the pattern /[0-9][0-9]*/.')
      end

      if @relationship.nil?
        invalid_properties.push('invalid value for "relationship", relationship cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @amount_limit.nil?
      return false if @beneficiary_account.nil?
      return false if @institution.nil?
      return false if @kind_of_relationship.nil?
      return false if !@numeric_reference_spid.nil? && @numeric_reference_spid.to_s.length > 7
      return false if !@numeric_reference_spid.nil? && @numeric_reference_spid.to_s.length < 1
      return false if !@numeric_reference_spid.nil? && @numeric_reference_spid !~ Regexp.new(/[0-9][0-9]*/)
      return false if @relationship.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] numeric_reference_spid Value to be assigned
    def numeric_reference_spid=(numeric_reference_spid)
      if !numeric_reference_spid.nil? && numeric_reference_spid.to_s.length > 7
        fail ArgumentError, 'invalid value for "numeric_reference_spid", the character length must be smaller than or equal to 7.'
      end

      if !numeric_reference_spid.nil? && numeric_reference_spid.to_s.length < 1
        fail ArgumentError, 'invalid value for "numeric_reference_spid", the character length must be great than or equal to 1.'
      end

      if !numeric_reference_spid.nil? && numeric_reference_spid !~ Regexp.new(/[0-9][0-9]*/)
        fail ArgumentError, 'invalid value for "numeric_reference_spid", must conform to the pattern /[0-9][0-9]*/.'
      end

      @numeric_reference_spid = numeric_reference_spid
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          amount_limit == o.amount_limit &&
          bank == o.bank &&
          beneficiary_account == o.beneficiary_account &&
          email == o.email &&
          institution == o.institution &&
          kind_of_relationship == o.kind_of_relationship &&
          numeric_reference_spid == o.numeric_reference_spid &&
          payment_concept_spid == o.payment_concept_spid &&
          register_date == o.register_date &&
          relationship == o.relationship &&
          rfc == o.rfc &&
          status == o.status
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [amount_limit, bank, beneficiary_account, email, institution, kind_of_relationship, numeric_reference_spid, payment_concept_spid, register_date, relationship, rfc, status].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = Wire4Client.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
