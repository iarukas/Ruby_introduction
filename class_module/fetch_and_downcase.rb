def fetch_and_downcase(ary, index)
  if str = ary[index]
    return str.downcase
  end
end

ary = ["Boo","Foo","Woo"]
for i in 0..2
  p fetch_and_downcase(ary, i)
end


