require 'rails_helper'

RSpec.feature "Visitor adds productsto the cart", type: :feature, js: true do

  # setup
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end 
  end

  scenario "Products get added to the cart when clicking Add-to-cart" do
    visit root_path
    first(".product").click_on "Add"
    expect(page).to have_content('My Cart (1)')
    save_screenshot("cart_test.png")
  end
end
