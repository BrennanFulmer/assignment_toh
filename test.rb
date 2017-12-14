a = ["o", "oo", "ooo"]

b = []

puts a
puts "newline"
puts b

b << a[0]
a.shift

puts a
puts "newline"
puts b
