def dice
	num = Random.rand(6)+1
end

def dice10
	num=0
	10.times do |i|
		num += Random.rand(6)+1
	end
	num
end

p dice

p dice10