array=["Ruby","Perl","PHP","Python"]
call_num=0
sorted = array.sort do |a,b|
  call_num +=1 
  puts a,b
  a.length <=>b.length
end
p sorted
puts "#{call_num}"

