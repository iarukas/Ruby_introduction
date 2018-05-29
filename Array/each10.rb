ary = []
100.times { |i| ary[i] = i+1}
result = Array.new
10.times { |i| result << ary[0+i*10..9+i*10]}
###############result << ary[i*10, 10]#####################


p result