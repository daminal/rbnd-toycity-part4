module Analyzable
  # Some of this code is borrowed from AntoineGS at github.com
	def average_price(attribute, items)
    sum = items.map { |item| item.send(attribute.to_sym).to_f }.reduce(:+)
    return (sum / items.size).round(2)
  end
  def count_by_brand(prods)
    tally = {}
    prods.each do |prod|
      unless tally.keys.include?(prod.brand)
        tally[prod.brand] = 1
      else tally[prod.brand] +=1
      end
    end
    tally
  end
  def count_by_name(prods)
	  tally = {}
	  prods.each do |prod|
	    tally[prod.name] = 0 
	    tally[prod.name] += 1
	  end
	  tally
	end
	def print_report(prods)
	  output = ""
	  output << "Average Price: #{average_price(prods)}\n"
	  output << "Inventory by Brand:\n"
	  count_by_brand(prods).each do |key,n|
	    output << "  - #{key}: #{n}\n" 
	  end
	  output << "Inventory by Name:\n"
	  count_by_name(prods).each do |key,n|
	    output << "  - #{key.capitalize}: #{n}\n" 
	  end
	  output
	end	
end
=begin
	
count_by_brand
count_by_name
average_price
print_report

and print out a summary report


=end