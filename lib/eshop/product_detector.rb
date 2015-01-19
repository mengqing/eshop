module Eshop
  class ProductDetector
    attr_reader :item, :price

    def initialize(item, price)
      @item = item
      @price = price
    end

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
