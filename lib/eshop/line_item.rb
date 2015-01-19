module Eshop
  class LineItem
    attr_reader :qty, :product, :sales_tax

    def initialize(qty, item, price)
      @qty = Integer(qty)
      @product = Eshop::ProductDetector.new(item, price).find_product_class
      @sales_tax = Eshop::SalesTax.new(@product)
    end

    def total_price_incl_tax
      @qty * (@product.price + @sales_tax.tax_amount).round(2)
    end

    def total_tax
      (total_price_incl_tax - (@product.price * @qty)).round(2)
    end

    def to_s
      "#{@qty}, #{@product.name}, #{'%.2f' % total_price_incl_tax}"
    end
  end
end
