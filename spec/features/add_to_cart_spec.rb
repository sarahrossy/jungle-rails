require 'rails_helper'

RSpec.feature "Visitor navigates from the home page to the cart", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
      
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end  

  scenario "Visitor adds a product to the cart" do
    # ACT
    visit root_path
    click_link("Add", match: :first)
    
    # VERIFY
    expect(page).to have_content("My Cart (1)")
    
    # DEBUG
    save_screenshot('test_add_to_cart.png')
  end
end