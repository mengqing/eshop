module Eshop
  module Product
    class Book < Product
      def initialize(name, price)
        super
      end

      def taxable?
        false unless imported?
      end

      def type
        'book'
      end
    end
  end
end
