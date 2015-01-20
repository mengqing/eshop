module Eshop
  # Calculates sales tax amount given the type
  # of the product
  #
  # @since 0.1.0
  class SalesTax

    # Base sales tax rate
    #
    # @since 0.1.0
    BASE_RATE                 = 10.freeze

    # Additional sales tax rate for imported products
    #
    # @since 0.1.0
    IMPORT_RATE               = 5.freeze

    # Multiplier used to calculate the rounding needed
    #
    # @since 0.1.0
    ROUNDING_MULTIPLIER       = 20.0.freeze

    attr_reader :product

    # SalesTax calculation
    #
    # @param product [Eshop::Product::Product] the product
    #
    # @since 0.1.0
    def initialize(product)
      @product = product
    end

    # Calculates the tax amount
    #
    # @since 0.1.0
    def tax_amount
      tax = @product.price * _get_tax_rate / 100
      (tax * ROUNDING_MULTIPLIER).ceil / ROUNDING_MULTIPLIER
    end

    private

    # @since 0.1.0
    def _get_tax_rate
      rate = 0
      rate += BASE_RATE if @product.taxable?
      rate += IMPORT_RATE if @product.imported?
      rate
    end
  end
end
