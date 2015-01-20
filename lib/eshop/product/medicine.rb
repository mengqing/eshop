module Eshop
  module Product
    # Product child class
    #
    # @since 0.1.0
    class Medicine < Product

      # Initialization
      #
      # @param [String] item name
      # @param [String,Float] item price
      #
      # @since 0.1.0
      def initialize(name, price)
        super
      end

      # Checkes whether product is taxable or not
      #
      # @since 0.1.0
      def taxable?
        false unless imported?
      end

      # Returns the type of the child product
      #
      # @since 0.1.0
      def type
        'medicine'
      end
    end
  end
end
