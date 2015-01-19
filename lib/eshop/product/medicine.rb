module Eshop
  module Product
    class Medicine < Product
      def initialize(name, price)
        super
      end

      def taxable?
        false unless imported?
      end

      def type
        'medicine'
      end
    end
  end
end
