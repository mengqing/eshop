module Eshop
  # Identifies the product based on naming convention
  #
  # @since 0.1.0
  class ProductDetector

    attr_reader :item, :price

    # Initialiation
    #
    # @param item [String] item name
    # @param price [String,Float] item price
    #
    # @since 0.1.0
    def initialize(item, price)
      @item   = item
      @price  = price
    end

    # Finds the product by name
    #
    # @since 0.1.0
    def find_product_class
      case @item
      when /book/
        Eshop::Product::Book.new(@item, @price)
      when /chocolate/
        Eshop::Product::Food.new(@item, @price)
      when /pill/
        Eshop::Product::Medicine.new(@item, @price)
      else
        Eshop::Product::Product.new(@item, @price)
      end
    end
  end
end
