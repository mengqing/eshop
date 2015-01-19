describe Eshop::ProductDetector do
  describe '#find_product_class' do
    it { expect(Eshop::ProductDetector.new('book','20').find_product_class).to be_an_instance_of(Eshop::Product::Book)}
    it { expect(Eshop::ProductDetector.new('pill','19').find_product_class).to be_an_instance_of(Eshop::Product::Medicine)}
    it { expect(Eshop::ProductDetector.new('chocolate','10').find_product_class).to be_an_instance_of(Eshop::Product::Food)}
    it { expect(Eshop::ProductDetector.new('playstation','299').find_product_class).to be_an_instance_of(Eshop::Product::Product)}
  end
end
