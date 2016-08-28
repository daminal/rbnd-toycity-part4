require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
	# Used LittleStupid/rbnd-toycity-part4 for code examples. 
  # Your code goes here!
  # Make a new array, parse csv into objects and return them in array
  def self.all
    objects = Array.new
    data_path = File.dirname(__FILE__) + "/../data/data.csv"
    CSV.foreach( data_path, headers: true ) do |data|
      objects << self.new( id: data["id"], price: data["price"], brand: data["brand"], name: data["product"] )
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
end
