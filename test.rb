
a = [1, 2, 3]
b = [0]
limit = 1

print "\nEnter where you'd like to move from "
from = gets.chomp

print "\nEnter where you'd like to move to "
to = gets.chomp

while limit == 1
  if from == "a" && to == "b"
    if b == []
      b << a[0]
      a.shift
      puts "breaking"
      break
    end
    if a[0] < b[0]
      b << a[0]
      a.shift
      puts "moved"
    end
      puts "eh"
  else
    puts "nope"
  end
    limit -= 1
end

puts a
puts "newline"
puts b
