def sum_array(num1,num2)
	num3 = []
	i=0
	num1.each do |a|
		num3 << a+num2[i]
	i+=1
	end
	return num3
end

#######################別解#################################
=begin

def sum_array(num1.num2)
	num3 = []
	num1.zip(num2){|a,b|num3 << a+b}
	return num3
end

=end

p sum_array([1,2,3],[4,6,8])