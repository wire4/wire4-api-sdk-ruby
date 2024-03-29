=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'date'

module Wire4Client
  # Objeto que contiene la información del previo y nuevo monto límite.
  class AmountRequest
    # Es el nuevo monto límite que reemplazará al actual, un monto de 0.0 implica que no hay límite.
    attr_accessor :amount_limit

    # Es la dirección URL a la que se redirigirá en caso de que el cliente cancele el registro. Se valida hasta 512 caracteres.
    attr_accessor :cancel_return_url

    # Es el código de divisa de la cuenta. Es en el formato estándar de 3 dígitos, por ejemplo para el peso mexicano: <b>MXP</b>, para el dólar estadounidense: <b>USD</b>.
    attr_accessor :currency_code

    # Es el monto límite registrado actualmente, un monto de 0.0 implica que no hay límite.
    attr_accessor :previous_amount_limit

    # Es la dirección URL a la que se redirigirá en caso de éxito. Se valida hasta 512 caracteres.
    attr_accessor :return_url

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'amount_limit' => :'amount_limit',
        :'cancel_return_url' => :'cancel_return_url',
        :'currency_code' => :'currency_code',
        :'previous_amount_limit' => :'previous_amount_limit',
        :'return_url' => :'return_url'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'amount_limit' => :'Float',
        :'cancel_return_url' => :'String',
        :'currency_code' => :'String',
        :'previous_amount_limit' => :'Float',
        :'return_url' => :'String'
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

      if attributes.has_key?(:'cancel_return_url')
        self.cancel_return_url = attributes[:'cancel_return_url']
      end

      if attributes.has_key?(:'currency_code')
        self.currency_code = attributes[:'currency_code']
      end

      if attributes.has_key?(:'previous_amount_limit')
        self.previous_amount_limit = attributes[:'previous_amount_limit']
      end

      if attributes.has_key?(:'return_url')
        self.return_url = attributes[:'return_url']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @amount_limit.nil?
        invalid_properties.push('invalid value for "amount_limit", amount_limit cannot be nil.')
      end

      if @amount_limit < 0
        invalid_properties.push('invalid value for "amount_limit", must be greater than or equal to 0.')
      end

      if @cancel_return_url.nil?
        invalid_properties.push('invalid value for "cancel_return_url", cancel_return_url cannot be nil.')
      end

      if @cancel_return_url.to_s.length > 512
        invalid_properties.push('invalid value for "cancel_return_url", the character length must be smaller than or equal to 512.')
      end

      if @cancel_return_url.to_s.length < 10
        invalid_properties.push('invalid value for "cancel_return_url", the character length must be great than or equal to 10.')
      end

      if @currency_code.nil?
        invalid_properties.push('invalid value for "currency_code", currency_code cannot be nil.')
      end

      if @previous_amount_limit.nil?
        invalid_properties.push('invalid value for "previous_amount_limit", previous_amount_limit cannot be nil.')
      end

      if @previous_amount_limit < 0
        invalid_properties.push('invalid value for "previous_amount_limit", must be greater than or equal to 0.')
      end

      if @return_url.nil?
        invalid_properties.push('invalid value for "return_url", return_url cannot be nil.')
      end

      if @return_url.to_s.length > 512
        invalid_properties.push('invalid value for "return_url", the character length must be smaller than or equal to 512.')
      end

      if @return_url.to_s.length < 10
        invalid_properties.push('invalid value for "return_url", the character length must be great than or equal to 10.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @amount_limit.nil?
      return false if @amount_limit < 0
      return false if @cancel_return_url.nil?
      return false if @cancel_return_url.to_s.length > 512
      return false if @cancel_return_url.to_s.length < 10
      return false if @currency_code.nil?
      return false if @previous_amount_limit.nil?
      return false if @previous_amount_limit < 0
      return false if @return_url.nil?
      return false if @return_url.to_s.length > 512
      return false if @return_url.to_s.length < 10
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] amount_limit Value to be assigned
    def amount_limit=(amount_limit)
      if amount_limit.nil?
        fail ArgumentError, 'amount_limit cannot be nil'
      end

      if amount_limit < 0
        fail ArgumentError, 'invalid value for "amount_limit", must be greater than or equal to 0.'
      end

      @amount_limit = amount_limit
    end

    # Custom attribute writer method with validation
    # @param [Object] cancel_return_url Value to be assigned
    def cancel_return_url=(cancel_return_url)
      if cancel_return_url.nil?
        fail ArgumentError, 'cancel_return_url cannot be nil'
      end

      if cancel_return_url.to_s.length > 512
        fail ArgumentError, 'invalid value for "cancel_return_url", the character length must be smaller than or equal to 512.'
      end

      if cancel_return_url.to_s.length < 10
        fail ArgumentError, 'invalid value for "cancel_return_url", the character length must be great than or equal to 10.'
      end

      @cancel_return_url = cancel_return_url
    end

    # Custom attribute writer method with validation
    # @param [Object] previous_amount_limit Value to be assigned
    def previous_amount_limit=(previous_amount_limit)
      if previous_amount_limit.nil?
        fail ArgumentError, 'previous_amount_limit cannot be nil'
      end

      if previous_amount_limit < 0
        fail ArgumentError, 'invalid value for "previous_amount_limit", must be greater than or equal to 0.'
      end

      @previous_amount_limit = previous_amount_limit
    end

    # Custom attribute writer method with validation
    # @param [Object] return_url Value to be assigned
    def return_url=(return_url)
      if return_url.nil?
        fail ArgumentError, 'return_url cannot be nil'
      end

      if return_url.to_s.length > 512
        fail ArgumentError, 'invalid value for "return_url", the character length must be smaller than or equal to 512.'
      end

      if return_url.to_s.length < 10
        fail ArgumentError, 'invalid value for "return_url", the character length must be great than or equal to 10.'
      end

      @return_url = return_url
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          amount_limit == o.amount_limit &&
          cancel_return_url == o.cancel_return_url &&
          currency_code == o.currency_code &&
          previous_amount_limit == o.previous_amount_limit &&
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
      [amount_limit, cancel_return_url, currency_code, previous_amount_limit, return_url].hash
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
