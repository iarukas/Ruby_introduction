a = []
100.times { |i| a[i] = i+1}
sum = 0
a.each { |elem| sum += elem }
print "合計:",sum,"\n"