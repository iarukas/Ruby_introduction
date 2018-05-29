def prime?(num)
	count = 0
	1.upto(num) do |i|
		if num%i == 0
			count+=1 
		end
	end

	if count == 2
		return true
	end 
	return false
end


1.upto(10) do |n|
	if prime?(n) 
		p n ,prime?(n)
	end
end 