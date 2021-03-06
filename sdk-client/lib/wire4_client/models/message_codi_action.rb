=begin
#Wire4RestAPI

#Referencia de la API de Wire4

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.10

=end

require 'date'

module Wire4Client
  # Es el objeto del mensaje que se envía con la información del punto de venta registrado.
  class MessageCodiAction
    # Es el monto de la operación de pago.
    attr_accessor :amount

    # Es el concepto de la transacción.
    attr_accessor :concept

    # Es la fecha de expiración de la operación.
    attr_accessor :due_date

    # Es el UUID de la operación.
    attr_accessor :id

    # Es el campo Metadata asociado a la petición de pago. Es información que indica guardar la petición.
    attr_accessor :metadata

    # Es la fecha de la operación.
    attr_accessor :operation_date

    # Es el identificador de la petición.
    attr_accessor :order_id

    # Es el tipo de pago.
    attr_accessor :payment_type

    # Es el número de referencia.
    attr_accessor :reference

    # Identidicador del punto de venta a la que pertenece la petición de pago.
    attr_accessor :sales_point_id

    # Es el estado (estatus) de la operación de pago.
    attr_accessor :status

    # Es el identificador de la transacción.
    attr_accessor :transaction_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'amount' => :'amount',
        :'concept' => :'concept',
        :'due_date' => :'due_date',
        :'id' => :'id',
        :'metadata' => :'metadata',
        :'operation_date' => :'operation_date',
        :'order_id' => :'order_id',
        :'payment_type' => :'payment_type',
        :'reference' => :'reference',
        :'sales_point_id' => :'sales_point_id',
        :'status' => :'status',
        :'transaction_id' => :'transaction_id'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'amount' => :'Float',
        :'concept' => :'String',
        :'due_date' => :'DateTime',
        :'id' => :'String',
        :'metadata' => :'String',
        :'operation_date' => :'DateTime',
        :'order_id' => :'String',
        :'payment_type' => :'String',
        :'reference' => :'String',
        :'sales_point_id' => :'String',
        :'status' => :'String',
        :'transaction_id' => :'String'
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

      if attributes.has_key?(:'concept')
        self.concept = attributes[:'concept']
      end

      if attributes.has_key?(:'due_date')
        self.due_date = attributes[:'due_date']
      end

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'metadata')
        self.metadata = attributes[:'metadata']
      end

      if attributes.has_key?(:'operation_date')
        self.operation_date = attributes[:'operation_date']
      end

      if attributes.has_key?(:'order_id')
        self.order_id = attributes[:'order_id']
      end

      if attributes.has_key?(:'payment_type')
        self.payment_type = attributes[:'payment_type']
      end

      if attributes.has_key?(:'reference')
        self.reference = attributes[:'reference']
      end

      if attributes.has_key?(:'sales_point_id')
        self.sales_point_id = attributes[:'sales_point_id']
      end

      if attributes.has_key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.has_key?(:'transaction_id')
        self.transaction_id = attributes[:'transaction_id']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          amount == o.amount &&
          concept == o.concept &&
          due_date == o.due_date &&
          id == o.id &&
          metadata == o.metadata &&
          operation_date == o.operation_date &&
          order_id == o.order_id &&
          payment_type == o.payment_type &&
          reference == o.reference &&
          sales_point_id == o.sales_point_id &&
          status == o.status &&
          transaction_id == o.transaction_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [amount, concept, due_date, id, metadata, operation_date, order_id, payment_type, reference, sales_point_id, status, transaction_id].hash
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
