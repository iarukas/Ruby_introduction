a = []

100.times do |i|
	a[i] = i+1
end

a3 = a.delete_if { |i| i%3!=0 }
p a3

#別解
=begin
# なお、条件に当てはまるものだけ返す、!が不要なselectというメソッドもあります
a4 = a.select{|i| i % 3 == 0 }
p a4
 
# aryから3の倍数以外の数を削除する
a.reject!{|i| i % 3 != 0 }
p a

=end
