=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'date'

module Wire4Client
  class CodiOperationsFiltersRequestDTO
    # Monto minimo, dos decimales
    attr_accessor :amount_from

    # Monto máximo,dos decimales
    attr_accessor :amount_to

    # Fecha de operación desde
    attr_accessor :operation_date_from

    # Fecha de operación hasta
    attr_accessor :operation_date_to

    # Order id de la petición
    attr_accessor :order_id

    # Fecha de petición desde
    attr_accessor :request_date_from

    # Fecha de petición hasta
    attr_accessor :request_date_to

    # Estatus de petición
    attr_accessor :status

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'amount_from' => :'amount_from',
        :'amount_to' => :'amount_to',
        :'operation_date_from' => :'operation_date_from',
        :'operation_date_to' => :'operation_date_to',
        :'order_id' => :'order_id',
        :'request_date_from' => :'request_date_from',
        :'request_date_to' => :'request_date_to',
        :'status' => :'status'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'amount_from' => :'Float',
        :'amount_to' => :'Float',
        :'operation_date_from' => :'Date',
        :'operation_date_to' => :'Date',
        :'order_id' => :'String',
        :'request_date_from' => :'Date',
        :'request_date_to' => :'Date',
        :'status' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'amount_from')
        self.amount_from = attributes[:'amount_from']
      end

      if attributes.has_key?(:'amount_to')
        self.amount_to = attributes[:'amount_to']
      end

      if attributes.has_key?(:'operation_date_from')
        self.operation_date_from = attributes[:'operation_date_from']
      end

      if attributes.has_key?(:'operation_date_to')
        self.operation_date_to = attributes[:'operation_date_to']
      end

      if attributes.has_key?(:'order_id')
        self.order_id = attributes[:'order_id']
      end

      if attributes.has_key?(:'request_date_from')
        self.request_date_from = attributes[:'request_date_from']
      end

      if attributes.has_key?(:'request_date_to')
        self.request_date_to = attributes[:'request_date_to']
      end

      if attributes.has_key?(:'status')
        self.status = attributes[:'status']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@amount_from.nil? && @amount_from > 9999999.99
        invalid_properties.push('invalid value for "amount_from", must be smaller than or equal to 9999999.99.')
      end

      if !@amount_from.nil? && @amount_from < 0.01
        invalid_properties.push('invalid value for "amount_from", must be greater than or equal to 0.01.')
      end

      if !@amount_to.nil? && @amount_to > 9999999.99
        invalid_properties.push('invalid value for "amount_to", must be smaller than or equal to 9999999.99.')
      end

      if !@amount_to.nil? && @amount_to < 0.01
        invalid_properties.push('invalid value for "amount_to", must be greater than or equal to 0.01.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@amount_from.nil? && @amount_from > 9999999.99
      return false if !@amount_from.nil? && @amount_from < 0.01
      return false if !@amount_to.nil? && @amount_to > 9999999.99
      return false if !@amount_to.nil? && @amount_to < 0.01
      status_validator = EnumAttributeValidator.new('String', ['RECEIVED', 'COMPLETED', 'CANCELLED'])
      return false unless status_validator.valid?(@status)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] amount_from Value to be assigned
    def amount_from=(amount_from)
      if !amount_from.nil? && amount_from > 9999999.99
        fail ArgumentError, 'invalid value for "amount_from", must be smaller than or equal to 9999999.99.'
      end

      if !amount_from.nil? && amount_from < 0.01
        fail ArgumentError, 'invalid value for "amount_from", must be greater than or equal to 0.01.'
      end

      @amount_from = amount_from
    end

    # Custom attribute writer method with validation
    # @param [Object] amount_to Value to be assigned
    def amount_to=(amount_to)
      if !amount_to.nil? && amount_to > 9999999.99
        fail ArgumentError, 'invalid value for "amount_to", must be smaller than or equal to 9999999.99.'
      end

      if !amount_to.nil? && amount_to < 0.01
        fail ArgumentError, 'invalid value for "amount_to", must be greater than or equal to 0.01.'
      end

      @amount_to = amount_to
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('String', ['RECEIVED', 'COMPLETED', 'CANCELLED'])
      unless validator.valid?(status)
        fail ArgumentError, 'invalid value for "status", must be one of #{validator.allowable_values}.'
      end
      @status = status
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          amount_from == o.amount_from &&
          amount_to == o.amount_to &&
          operation_date_from == o.operation_date_from &&
          operation_date_to == o.operation_date_to &&
          order_id == o.order_id &&
          request_date_from == o.request_date_from &&
          request_date_to == o.request_date_to &&
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
      [amount_from, amount_to, operation_date_from, operation_date_to, order_id, request_date_from, request_date_to, status].hash
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