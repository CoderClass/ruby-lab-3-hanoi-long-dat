require 'rails_helper'

RSpec.feature "SortProducts", type: :feature do
  def hat_links
    page.all(:css, "h4.product-name a").map(&:text)
  end

  scenario "visit clicks on Sort by Alphabetical" do
    product4 = Product.create(name: "Louis's Hat", image_path:"A")
		product3 = Product.create(name: "Henry's Hat", image_path:"A")
		product1 = Product.create(name: "Brad's Hat", image_path:"A")
		product2 = Product.create(name: "Chad's Hat", image_path:"A")
    # TODO: create another product with "Adam's Hat" name

    visit root_path

    # verify the products are displayed in the order they were created:
    expect(hat_links).to eq ["Louis's Hat", "Henry's Hat", "Brad's Hat", "Chad's Hat"]

    # use Capybara's click_link to find a link with the exact text
    click_link "Sort by Alphabetical" # TODO: add this link in your view file to make this line pass
    # test that the current_url is exactly where the link should go
    expect(current_url).to eq root_url(sort: "alphabetical") # TODO: make sure your link submits to the correct URL
    # test that hat names are in the right order now
    expect(hat_links).to eq [product1.name,product2.name,product3.name,product4.name]
  end
end
