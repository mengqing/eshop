require 'bigdecimal'

module Eshop
  module Product
    class Product
      attr_accessor :name, :price, :type

      def initialize(name, price)
        @name = name
        @price = BigDecimal.new(price)
      end

      def imported?
        @name.downcase.include? 'import'
      end

      def taxable?
        true
      end

      def type
        'taxable product'
      end
    end
  end
end
