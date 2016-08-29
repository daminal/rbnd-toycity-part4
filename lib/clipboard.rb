<<<<<<< HEAD

=======
# Used LittleStupid/rbnd-toycity-part4 for code examples. 
>>>>>>> udacidata


=begin 
first problem: create(opts = {})
<<<<<<< HEAD
open a CSV file


=end
=======
1. open a CSV file and check whether a particular item exists.
How do I do this? I have to find an example of something doing this in the provided code. 

Here's what the below func does.
It sets up an objects array to hold each item of the array. 
It tells class CSV where to get its data
=end
  def self.all
    objects = Array.new
    data_path = File.dirname(__FILE__) + "/../data/data.csv"
    CSV.foreach( data_path, headers: true ) do |data|
    	object = id: data["id"], price: data["price"], brand: data["brand"], name: data["product"] 
      objects << self.new(object)
    end

    objects
  end



remaining code



# def self.first( num = nil)
#   num ? all.first(num) : all.first
# end

# def self.last( num = nil )
#   num ? all.last(num) : all.last
# end
# def self.find( id )
#   result = all.find { |obj| obj.id == id }

#   if( result == nil )
#     raise ProductNotFoundError, "Cannot find this item"
#   end

#   result
# end

#   def self.destroy( id )
#     del_obj = find( id )

#     if( del_obj == nil )
#       return
#     end

#     file = File.dirname(__FILE__) + "/../data/data.csv"
#     tbl = CSV.table( file )

#     tbl.delete_if do |data|
#       data[:id] == id
#     end

#     reset_file()
#     CSV.open(file, "a+") do |csv|
#       tbl.each do |row|
#         csv << row
#       end
#     end

#     del_obj
#   end



#   def self.reset_file()
#     @data_path = File.dirname(__FILE__) + "/../data/data.csv"
#     CSV.open(@data_path, "wb") do |csv|
#       csv << ["id", "brand", "product", "price"]
#     end
#   end

#   def self.where( options={} )
#     if( options == nil )
#       return nil
#     end

#     objs = []
#     all.each do |obj|

#       found = true

#       options.each do |k,v|
#         if( obj.send(k) != v )
#           found = false;
#         end
#       end

#       if( found )
#         objs << obj
#       end
#     end
#       objs
#   end



#   def update( options = {} )
#   #Product.create( options )
# =begin
#   products = Product.all
#   product = products.find { |product| product.id == @id }

#   if( product == nil )
#     return nil
#   end

#   if( options[:price] != nil)
#     product.price = options[:price]
#   end

#   if( options[:brand] != nil )
#     product.brand = options[:brand]
#   end

#   Product.reset_file
# =end
#   file = File.dirname(__FILE__) + "/../data/data.csv"
#   tbl = CSV.table( file )

#   tbl.each do |data|
#     if( data[:id] == id )
#       if( options[:brand] != nil )
#         data[:brand] = options[:brand]
#       end

#       if( options[:price] != nil )
#         data[:price] = options[:price]
#       end
#     end
#   end

#   Udacidata.reset_file()
#   CSV.open(file, "a+") do |csv|
#     tbl.each do |row|
#       csv << row
#     end
#   end

#   Product.find(@id)
#   #products.each do |product|
#   #  Product.create( price: product.price, brand: product.brand, name: product.name )
#   #end

#   #product
# end
>>>>>>> udacidata
