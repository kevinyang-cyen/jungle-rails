require 'rails_helper'

RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do

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

  scenario "They click on details" do
    # ACT
    visit root_path

    # hover over the first product and click add
    first("article.product").find_link('Details »').click
    
    expect(page).to have_content "Name"

    # DEBUG / VERIFY
    # save_screenshot
    # puts page.html
  end

end
