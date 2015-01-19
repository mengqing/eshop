describe Eshop::LineItem do
  context 'with one qty of taxable product' do
    let(:line_item) { Eshop::LineItem.new(1, 'music cd', '14.99') }

    describe '#total_price_incl_tax' do
      it { expect(line_item.total_price_incl_tax).to eq(16.49) }
    end

    describe '#total_tax' do
      it { expect(line_item.total_tax).to eq(1.5) }
    end
  end

  context 'with multiple qtys of taxable products' do
    let(:line_item) { Eshop::LineItem.new(2, 'bottle of perfume', '18.99') }

    describe '#total_price_incl_tax' do
      it { expect(line_item.total_price_incl_tax).to eq(41.78) }
    end

    describe '#total_tax' do
      it { expect(line_item.total_tax).to eq(3.8) }
    end
  end
end
