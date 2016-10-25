require 'rails_helper'

RSpec.describe Product, type: :model do

	describe ".alphabetical" do 
		it "should return a sorted array base on name, order by alphabetical" do
			c = Product.create(name: "c")
			a = Product.create(name: "a")
			b = Product.create(name: "b")
			
			expect(Product.alphabetical).to eq [a,b,c]
		end
	end 
end

