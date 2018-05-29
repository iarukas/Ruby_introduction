a = []

100.times do |i|
	a[i] = i+1
end
a2 = a.collect{|i| i*100}
p a2
#別解
=begin
a = (1..100).to_a
=end

