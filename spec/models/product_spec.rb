require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.new(
      name: 'Lifestyle'
      )
    @product = Product.new(
      name: 'Test',
      price_cents: 1000,
      quantity: 2,
      category: @category
      )
  end    

  describe 'Validations' do
    # Create an initial example that ensures that a product with all four fields set will indeed save successfully
    it "should save successfully with all parameters" do
      expect(@product.save).to eq(true)
    end

    it "should not save successfully if name = nil" do
      @product.name = nil
      @product.save
      expect(@product).to_not be_valid
    end

    it "should not save successfully if price = nil" do
      @product.price_cents = nil
      @product.save
      expect(@product).to_not be_valid
    end
    
    it "should not save successfully if quantity = nil" do
      @product.quantity = nil
      @product.save
      expect(@product).to_not be_valid
    end
    
    it "should not save successfully if category = nil" do
      @product.category = nil
      @product.save
      expect(@product).to_not be_valid
    end
  end
end