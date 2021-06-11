=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'date'

module Wire4Client
  # Objeto que contiene la información de una transferencia SPID® de salida.
  class TransactionOutgoingSpid
    # Es el monto de la transferencia. Se valida que sean máximo 20 dígitos y 2 decimales. Ejemplo 1000.00
    attr_accessor :amount

    # Cuenta del beneficiario, podría ser un número celular (10dígitos), tarjeta de débito (TDD) o Cuenta CLABE interbancaria (18 dígitos). 
    attr_accessor :beneficiary_account

    # Es la dirección URL a la que se redirigirá en caso de que el usario cancele el registro.
    attr_accessor :cancel_return_url

    # Es el identificador de la clasificación de la transferencia SPID.
    attr_accessor :classification_id

    # Código de moneda en la que opera la cuenta.
    attr_accessor :currency_code

    # Lista de correo electrónico (email) del beneficiario. Este campo es opcional.
    attr_accessor :email

    # Es la referencia numérica de la transferencia.
    attr_accessor :numeric_reference_spid

    # Es la referencia de la transferencia asignada por el cliente. Ejemplo: dae9c6ae-8c7a-42e8-99f4-ebe90566efae
    attr_accessor :order_id

    # Es el concepto de la transferencia.
    attr_accessor :payment_concept_spid

    # Es la dirección URL a la que se redirigirá en caso de éxito.
    attr_accessor :return_url

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'amount' => :'amount',
        :'beneficiary_account' => :'beneficiary_account',
        :'cancel_return_url' => :'cancel_return_url',
        :'classification_id' => :'classification_id',
        :'currency_code' => :'currency_code',
        :'email' => :'email',
        :'numeric_reference_spid' => :'numeric_reference_spid',
        :'order_id' => :'order_id',
        :'payment_concept_spid' => :'payment_concept_spid',
        :'return_url' => :'return_url'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'amount' => :'Float',
        :'beneficiary_account' => :'String',
        :'cancel_return_url' => :'String',
        :'classification_id' => :'String',
        :'currency_code' => :'String',
        :'email' => :'Array<String>',
        :'numeric_reference_spid' => :'Integer',
        :'order_id' => :'String',
        :'payment_concept_spid' => :'String',
        :'return_url' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.has_key?(:'beneficiary_account')
        self.beneficiary_account = attributes[:'beneficiary_account']
      end

      if attributes.has_key?(:'cancel_return_url')
        self.cancel_return_url = attributes[:'cancel_return_url']
      end

      if attributes.has_key?(:'classification_id')
        self.classification_id = attributes[:'classification_id']
      end

      if attributes.has_key?(:'currency_code')
        self.currency_code = attributes[:'currency_code']
      end

      if attributes.has_key?(:'email')
        if (value = attributes[:'email']).is_a?(Array)
          self.email = value
        end
      end

      if attributes.has_key?(:'numeric_reference_spid')
        self.numeric_reference_spid = attributes[:'numeric_reference_spid']
      end

      if attributes.has_key?(:'order_id')
        self.order_id = attributes[:'order_id']
      end

      if attributes.has_key?(:'payment_concept_spid')
        self.payment_concept_spid = attributes[:'payment_concept_spid']
      end

      if attributes.has_key?(:'return_url')
        self.return_url = attributes[:'return_url']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @amount.nil?
        invalid_properties.push('invalid value for "amount", amount cannot be nil.')
      end

      if @amount < 0.01
        invalid_properties.push('invalid value for "amount", must be greater than or equal to 0.01.')
      end

      if @beneficiary_account.nil?
        invalid_properties.push('invalid value for "beneficiary_account", beneficiary_account cannot be nil.')
      end

      if @cancel_return_url.nil?
        invalid_properties.push('invalid value for "cancel_return_url", cancel_return_url cannot be nil.')
      end

      if @classification_id.nil?
        invalid_properties.push('invalid value for "classification_id", classification_id cannot be nil.')
      end

      if @currency_code.nil?
        invalid_properties.push('invalid value for "currency_code", currency_code cannot be nil.')
      end

      if @numeric_reference_spid.nil?
        invalid_properties.push('invalid value for "numeric_reference_spid", numeric_reference_spid cannot be nil.')
      end

      if @numeric_reference_spid > 9999999
        invalid_properties.push('invalid value for "numeric_reference_spid", must be smaller than or equal to 9999999.')
      end

      if @numeric_reference_spid < 0
        invalid_properties.push('invalid value for "numeric_reference_spid", must be greater than or equal to 0.')
      end

      if @order_id.nil?
        invalid_properties.push('invalid value for "order_id", order_id cannot be nil.')
      end

      if @order_id.to_s.length > 36
        invalid_properties.push('invalid value for "order_id", the character length must be smaller than or equal to 36.')
      end

      if @order_id.to_s.length < 1
        invalid_properties.push('invalid value for "order_id", the character length must be great than or equal to 1.')
      end

      if @payment_concept_spid.nil?
        invalid_properties.push('invalid value for "payment_concept_spid", payment_concept_spid cannot be nil.')
      end

      if @payment_concept_spid.to_s.length > 250
        invalid_properties.push('invalid value for "payment_concept_spid", the character length must be smaller than or equal to 250.')
      end

      if @payment_concept_spid.to_s.length < 1
        invalid_properties.push('invalid value for "payment_concept_spid", the character length must be great than or equal to 1.')
      end

      if @return_url.nil?
        invalid_properties.push('invalid value for "return_url", return_url cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @amount.nil?
      return false if @amount < 0.01
      return false if @beneficiary_account.nil?
      return false if @cancel_return_url.nil?
      return false if @classification_id.nil?
      return false if @currency_code.nil?
      return false if @numeric_reference_spid.nil?
      return false if @numeric_reference_spid > 9999999
      return false if @numeric_reference_spid < 0
      return false if @order_id.nil?
      return false if @order_id.to_s.length > 36
      return false if @order_id.to_s.length < 1
      return false if @payment_concept_spid.nil?
      return false if @payment_concept_spid.to_s.length > 250
      return false if @payment_concept_spid.to_s.length < 1
      return false if @return_url.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] amount Value to be assigned
    def amount=(amount)
      if amount.nil?
        fail ArgumentError, 'amount cannot be nil'
      end

      if amount < 0.01
        fail ArgumentError, 'invalid value for "amount", must be greater than or equal to 0.01.'
      end

      @amount = amount
    end

    # Custom attribute writer method with validation
    # @param [Object] numeric_reference_spid Value to be assigned
    def numeric_reference_spid=(numeric_reference_spid)
      if numeric_reference_spid.nil?
        fail ArgumentError, 'numeric_reference_spid cannot be nil'
      end

      if numeric_reference_spid > 9999999
        fail ArgumentError, 'invalid value for "numeric_reference_spid", must be smaller than or equal to 9999999.'
      end

      if numeric_reference_spid < 0
        fail ArgumentError, 'invalid value for "numeric_reference_spid", must be greater than or equal to 0.'
      end

      @numeric_reference_spid = numeric_reference_spid
    end

    # Custom attribute writer method with validation
    # @param [Object] order_id Value to be assigned
    def order_id=(order_id)
      if order_id.nil?
        fail ArgumentError, 'order_id cannot be nil'
      end

      if order_id.to_s.length > 36
        fail ArgumentError, 'invalid value for "order_id", the character length must be smaller than or equal to 36.'
      end

      if order_id.to_s.length < 1
        fail ArgumentError, 'invalid value for "order_id", the character length must be great than or equal to 1.'
      end

      @order_id = order_id
    end

    # Custom attribute writer method with validation
    # @param [Object] payment_concept_spid Value to be assigned
    def payment_concept_spid=(payment_concept_spid)
      if payment_concept_spid.nil?
        fail ArgumentError, 'payment_concept_spid cannot be nil'
      end

      if payment_concept_spid.to_s.length > 250
        fail ArgumentError, 'invalid value for "payment_concept_spid", the character length must be smaller than or equal to 250.'
      end

      if payment_concept_spid.to_s.length < 1
        fail ArgumentError, 'invalid value for "payment_concept_spid", the character length must be great than or equal to 1.'
      end

      @payment_concept_spid = payment_concept_spid
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          amount == o.amount &&
          beneficiary_account == o.beneficiary_account &&
          cancel_return_url == o.cancel_return_url &&
          classification_id == o.classification_id &&
          currency_code == o.currency_code &&
          email == o.email &&
          numeric_reference_spid == o.numeric_reference_spid &&
          order_id == o.order_id &&
          payment_concept_spid == o.payment_concept_spid &&
          return_url == o.return_url
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [amount, beneficiary_account, cancel_return_url, classification_id, currency_code, email, numeric_reference_spid, order_id, payment_concept_spid, return_url].hash
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
