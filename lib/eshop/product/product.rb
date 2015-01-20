require 'bigdecimal'

module Eshop
  module Product
    # Product parent class
    #
    # @since 0.1.0
    class Product

      attr_accessor :name, :price, :type

      # Initialization
      #
      # @param [String] item name
      # @param [String,Float] item price
      #
      # @since 0.1.0
      def initialize(name, price)
        @name   = name
        @price  = BigDecimal.new(price)
      end

      # Checks whether the product is imported or not
      #
      # @since 0.1.0
      def imported?
        @name.downcase.include? 'import'
      end

      # Base product is always taxable
      #
      # @since 0.1.0
      def taxable?
        true
      end

      # Returns the type of the product
      #
      # @since 0.1.0
      def type
        'taxable product'
      end
    end
  end
end
