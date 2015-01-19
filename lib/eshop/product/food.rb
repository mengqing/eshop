module Eshop
  module Product
    class Food < Product
      def initialize(name, price)
        super
      end

      def taxable?
        false unless imported?
      end

      def type
        'food'
      end
    end
  end
end
