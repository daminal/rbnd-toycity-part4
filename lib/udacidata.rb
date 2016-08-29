require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
	@@file = File.dirname(__FILE__) + "/../data/data.csv"
	# Used LittleStupid/rbnd-toycity-part4 for code examples.
	create_finder_methods( "name", "brand" )
  def self.all
    objects = Array.new
    CSV.foreach(@@file, headers: true) do |data|
    	obj = {id: data["id"], price: data["price"], brand: data["brand"], name: data["product"]}
      objects << self.new(obj)
    end
    objects
  end
  def self.update?(id)
    all.any? {|prod| prod.id == id}
  end 
  def self.create(attributes = nil)
    prod = self.new(attributes)

    if(self.update?(prod.id) == false)
      CSV.open(@@file, "a+") do |csv|
        csv << [prod.id, prod.brand, prod.name, prod.price ]
      end
    end
    prod
  end
  def self.first(n = nil)
    n ? all.first(n) : all.first
  end
  def self.last(n = nil)
  	n ? all.last(n) : all.last
  end
  def self.find(id)
  	all[id-1]
  end
  def self.destroy(id)
	  object = find(id)
	  if id
		  table = CSV.table(@@file)
		  table.delete_if do |data|
		    data[:id] == id
		  end
		  CSV.open(@@file, "w") do |csv|
		  	csv << ["id", "brand", "product", "price"]
		    table.each do |row|
		      csv << row
		    end
		  end
		  object
		end
	end
	def self.where(opt = {})
		self.all.select {|prod| opt[:brand] == prod.brand || opt[:name] == prod.name}
	end
	#get the object and for each attribute present, redefine that attribute. Then write it. 
  def update( options = {} )
  	tbl = CSV.table(@@file)
  	tbl.each do |data|
	    if( data[:id] == id )
	      data[:brand] = options[:brand] if( options[:brand] != nil )
	      data[:price] = options[:price] if( options[:price] != nil )
    	end
  	end
  CSV.open(@@file, "w") do |csv|
  	csv << ["id", "brand", "product", "price"]
    tbl.each do |prod|
      csv << prod
    end
  end
  Product.find(@id)
end
	# def update(opt = {})
	# 	brand = opt[:brand] ? opt[:brand] : self.brand
	# 	name = opt[:name] ? opt[:name] : self.name
	# 	price = opt[:price] ? opt[:price] : self.price
	# 	new_prod = Product.create(id: self.id, brand: brand, name: name, price: price)
	# 	return new_prod
	# end
end


