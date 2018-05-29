a = gets.to_i
s=a%60
h=a/3600
m=a/60-h*60

print h,":",m,":",s,"\n"
