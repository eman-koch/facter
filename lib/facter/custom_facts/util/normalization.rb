# frozen_string_literal: true

module LegacyFacter
  module Util
    module Normalization
      class NormalizationError < StandardError; end

      # load Date and Time classes
      require 'time'

      VALID_TYPES = [Integer, Float, TrueClass, FalseClass, NilClass, Symbol, String, Array, Hash, Date, Time].freeze

      module_function

      # Recursively normalize the given data structure
      #
      # @api public
      # @raise [NormalizationError] If the data structure contained an invalid element.
      # @return [void]
      def normalize(value)
        case value
        when Integer, Float, TrueClass, FalseClass, NilClass, Symbol
          value
        when Date, Time
          value.iso8601
        when String
          normalize_string(value)
        when Array
          normalize_array(value)
        when Hash
          normalize_hash(value)
        else
          raise NormalizationError, "Expected #{value} to be one of #{VALID_TYPES.inspect}, but was #{value.class}"
        end
      end

      # @!method normalize_string(value)
      #
      # Attempt to normalize and validate the given string.
      #
      # The string is validated by checking that the string encoding
      # is UTF-8 and that the string content matches the encoding. If the string
      # is not an expected encoding then it is converted to UTF-8.
      #
      # @api public
      # @raise [NormalizationError] If the string used an unsupported encoding or did not match its encoding
      # @param value [String]
      # @return [void]

      def normalize_string(value)
        value = value.encode(Encoding::UTF_8)

        unless value.valid_encoding?
          raise NormalizationError, "String #{value.inspect} doesn't match the reported encoding #{value.encoding}"
        end

        value
      rescue EncodingError
        raise NormalizationError, "String encoding #{value.encoding} is not UTF-8 and could not be converted to UTF-8"
      end

      # Validate all elements of the array.
      #
      # @api public
      # @raise [NormalizationError] If one of the elements failed validation
      # @param value [Array]
      # @return [void]
      def normalize_array(value)
        value.collect do |elem|
          normalize(elem)
        end
      end

      # Validate all keys and values of the hash.
      #
      # @api public
      # @raise [NormalizationError] If one of the keys or values failed normalization
      # @param value [Hash]
      # @return [void]
      def normalize_hash(value)
        Hash[value.collect { |k, v| [normalize(k), normalize(v)] }]
      end
    end
  end
end
