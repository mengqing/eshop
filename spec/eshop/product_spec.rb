shared_examples_for 'tax exempted product' do
  describe '#taxable?' do
    it { expect(product.taxable?).to be false }
  end

  describe '#imported?' do
    it { expect(product.imported?).to be false }
  end
end

describe Eshop::Product do
  context 'when it is a book' do
    it_should_behave_like 'tax exempted product' do
      let(:product) { Eshop::Product::Book.new('book', '12.49')}
    end
  end

  context 'when it is a food' do
    it_should_behave_like 'tax exempted product' do
      let(:product) { Eshop::Product::Food.new('chocolate bar', '0.85')}
    end
  end

  context 'when it is a medicine' do
    it_should_behave_like 'tax exempted product' do
      let(:product) { Eshop::Product::Medicine.new('packet of headache pillsr', '9.75')}
    end
  end

  context 'when it is an imported product' do
    let(:product) { Eshop::Product::Food.new('imported box of chocolates', '10.00')}

    describe '#imported?' do
      it { expect(product.imported?).to be true }
    end
  end
end
