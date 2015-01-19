module Eshop
  class Shop
    def initialize
      @line_items = []
    end

    def start
      puts 'Quantity, Product, Price'
      while user_input = Readline.readline.split(',').map(&:strip) do
        if user_input.empty?
          if @line_items.length
            _show_line_items
            _show_grand_total
          end
          break
        end

        if user_input.length != 3
          puts 'Incorrect syntax, please enter in the format of "Quantity, Product, Price"'
        else
          begin
            _add_line_item Eshop::LineItem.new(user_input[0], user_input[1], user_input[2])
          rescue
            puts 'Incorrect syntax, please enter in the format of "Quantity, Product, Price"'
          end
        end
      end
    end

    private
    
    def _add_line_item(line_item)
      @line_items << line_item
    end

    def _show_line_items
      puts @line_items.map(&:to_s)
    end

    def _show_grand_total
      puts "\n"
      puts "Sales Taxes: #{'%.2f' % @line_items.map(&:total_tax).reduce(:+)}"
      puts "Total: #{'%.2f' % @line_items.map(&:total_price_incl_tax).reduce(:+)}"
    end
  end
end
