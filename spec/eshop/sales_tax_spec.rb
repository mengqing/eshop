describe Eshop::SalesTax do
  context 'with taxable item' do
    let(:product)   { Eshop::ProductDetector.new('bottle of perfume', '18.99').find_product_class }
    let(:sales_tax) { Eshop::SalesTax.new(product)}

    describe '#tax_amount' do
      it { expect(sales_tax.tax_amount).to eq(1.9) }
    end
  end

  context 'with tax exempted item' do
    let(:product)   { Eshop::ProductDetector.new('book', '12.49').find_product_class }
    let(:sales_tax) { Eshop::SalesTax.new(product)}

    describe '#tax_amount' do
      it { expect(sales_tax.tax_amount).to eq 0 }
    end
  end
end
