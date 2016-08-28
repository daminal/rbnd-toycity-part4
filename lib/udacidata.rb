require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
	# Used LittleStupid/rbnd-toycity-part4 for code examples.
	create_finder_methods( "name", "brand" )
  # Your code goes here!
  def self.all
    objects = Array.new
    data_path = File.dirname(__FILE__) + "/../data/data.csv"
    CSV.foreach(data_path, headers: true) do |data|
    	obj = {id: data["id"], price: data["price"], brand: data["brand"], name: data["product"]}
      objects << self.new(obj)
    end
    objects
  end
  def self.exist?(id)
    all.any? {|obj| obj.id == id}
  end 
  def self.create( attributes = nil )
    obj = self.new( attributes )
    if(false == exist?( obj.id))
      file = File.dirname(__FILE__) + "/../data/data.csv"
      CSV.open(file, "a+") do |csv|
        csv << [obj.id, obj.brand, obj.name, obj.price ]
      end
    end
    obj
  end
  def self.first( num = nil)
    num ? all.first(num) : all.first
  end
end
