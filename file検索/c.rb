print 'Please search file name: '
fname = gets.chomp
print 'Please graduate: '
id = gets.chomp
id = "1#{id}0000".to_i

for i in (1..250)   
  begin 
    id += 1         

    Dir.chdir("/home/student/s#{id}")

    onfile = Dir.glob("**/#{fname}")
  rescue
    next
  end
  if(onfile.empty?)
    next
  end
  puts "s#{id} : #{onfile}"
  next
end


