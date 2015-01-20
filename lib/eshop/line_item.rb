module Eshop
  # Manipulation of the line item
  #
  # @since 0.1.0
  class LineItem

    attr_reader :qty, :product, :sales_tax

    # Initialization
    #
    # @param qty [String] line item qty
    # @param item [String] line item name
    # @param price [String,Float] line item price
    #
    # @since 0.1.0
    def initialize(qty, item, price)
      @qty          = Integer(qty)
      @product      = Eshop::ProductDetector.new(item, price).find_product_class
      @sales_tax    = Eshop::SalesTax.new(@product)
    end

    # Displays the total price for the line item including
    # tax amounts
    #
    # @since 0.1.0
    def total_price_incl_tax
      @qty * (@product.price + @sales_tax.tax_amount).round(2)
    end

    # Displays the total tax for the line item
    #
    # @since 0.1.0
    def total_tax
      (total_price_incl_tax - (@product.price * @qty)).round(2)
    end

    # Displays to stdout
    #
    # @since 0.1.0
    def to_s
      "#{@qty}, #{@product.name}, #{'%.2f' % total_price_incl_tax}"
    end
  end
end
