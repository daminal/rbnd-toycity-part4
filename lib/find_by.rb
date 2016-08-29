class Module
	def create_finder_methods(*attributes)
		attributes.each do |attr|
			func = %Q{def self.find_by_#{attr}(arg) Product.all.find{|a| a.#{attr} == arg} end}
			class_eval(func)
		end
	end
end