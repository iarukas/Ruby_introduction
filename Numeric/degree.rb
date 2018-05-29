def cels_to_fahr(cels)
	fahr = (cels.to_f*9.0)/5.0+32.0
end

def fahr_to_cels(fahr)
	cels = (fahr.to_f-32)*5.0/9.0
end

#p cels_to_fahr(3.0)
#p fahr_to_cels(37.4).round


1.upto(100) do |i|
print i ,'  ',fahr_to_cels(i) ,"\n"
end