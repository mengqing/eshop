module Eshop
  class SalesTax
    BASE_RATE                 = 10.freeze
    IMPORT_RATE               = 5.freeze
    ROUNDING_MULTIPLIER       = 20.0.freeze

    attr_reader :product

    def initialize(product)
      @product = product
    end

    def tax_amount
      tax = @product.price * _get_tax_rate / 100
      (tax * ROUNDING_MULTIPLIER).ceil / ROUNDING_MULTIPLIER
    end

    private
    def _get_tax_rate
      rate = 0
      rate += BASE_RATE if @product.taxable?
      rate += IMPORT_RATE if @product.imported?
      rate
    end
  end
end
