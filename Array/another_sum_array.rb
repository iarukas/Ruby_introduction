def sum_array(num1,num2)
	num3 = []
	num1.zip(num2){|a,b|num3 << a+b}
	return num3
end

p sum_array([1,2,3],[4,6,8])