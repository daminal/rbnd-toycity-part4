require 'faker'

def db_seed
  10.times do
    Product.create(brand: Faker::Company.name, name: Faker::Name.name,
    		 price: Faker::Commerce.price )
  end
end