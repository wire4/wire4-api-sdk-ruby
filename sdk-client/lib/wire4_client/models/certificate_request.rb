=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'date'

module Wire4Client
  # Certificado de la empresa que se esta registrando
  class CertificateRequest
    # Alias del certificado
    attr_accessor :_alias

    # Numero de certificado
    attr_accessor :certificate_number

    # Dígito verificador
    attr_accessor :check_digit

    # Información de cifrado
    attr_accessor :cipher_data

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'_alias' => :'alias',
        :'certificate_number' => :'certificate_number',
        :'check_digit' => :'check_digit',
        :'cipher_data' => :'cipher_data'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'_alias' => :'String',
        :'certificate_number' => :'String',
        :'check_digit' => :'String',
        :'cipher_data' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'alias')
        self._alias = attributes[:'alias']
      end

      if attributes.has_key?(:'certificate_number')
        self.certificate_number = attributes[:'certificate_number']
      end

      if attributes.has_key?(:'check_digit')
        self.check_digit = attributes[:'check_digit']
      end

      if attributes.has_key?(:'cipher_data')
        self.cipher_data = attributes[:'cipher_data']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@check_digit.nil? && @check_digit.to_s.length > 1
        invalid_properties.push('invalid value for "check_digit", the character length must be smaller than or equal to 1.')
      end

      if !@check_digit.nil? && @check_digit.to_s.length < 1
        invalid_properties.push('invalid value for "check_digit", the character length must be great than or equal to 1.')
      end

      if !@check_digit.nil? && @check_digit !~ Regexp.new(/\d/)
        invalid_properties.push('invalid value for "check_digit", must conform to the pattern /\\d/.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@check_digit.nil? && @check_digit.to_s.length > 1
      return false if !@check_digit.nil? && @check_digit.to_s.length < 1
      return false if !@check_digit.nil? && @check_digit !~ Regexp.new(/\d/)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] check_digit Value to be assigned
    def check_digit=(check_digit)
      if !check_digit.nil? && check_digit.to_s.length > 1
        fail ArgumentError, 'invalid value for "check_digit", the character length must be smaller than or equal to 1.'
      end

      if !check_digit.nil? && check_digit.to_s.length < 1
        fail ArgumentError, 'invalid value for "check_digit", the character length must be great than or equal to 1.'
      end

      if !check_digit.nil? && check_digit !~ Regexp.new(/\d/)
        fail ArgumentError, 'invalid value for "check_digit", must conform to the pattern /\\d/.'
      end

      @check_digit = check_digit
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          _alias == o._alias &&
          certificate_number == o.certificate_number &&
          check_digit == o.check_digit &&
          cipher_data == o.cipher_data
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [_alias, certificate_number, check_digit, cipher_data].hash
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
