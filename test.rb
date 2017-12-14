height = 3

a = [1, 2, 3]
b = [0]

print "\nEnter where you'd like to move from "
from = gets.chomp
print "\nEnter where you'd like to move to "
to = gets.chomp

if b == []
  b = [height + 1]
end

if from == "a" && to == "b"
  if a[0] > b[0]
    # split this part out into a seperate method to avoid repetition ?
    # or add to the if logic check and make the else statement a longer reminder of what's allowed?
    puts "illegal move"
    exit # break
  end
  b << a[0]
  a.shift
elsif from == "a" && to == "c"
  c << a[0]
  a.shift
elsif from == "b" && to == "c"
  c << b[0]
  b.shift
elsif from == "b" && to == "a"
  a << b[0]
  b.shift
elsif from == "c" && to == "a"
  a << c[0]
  c.shift
elsif from == "c" && to == "b"
  b << c[0]
  c.shift
elsif to == "quit"
  exit
else
  puts "\nPlease either enter quit to end the game or one of the following letters\na\nb\nc\n"
end

if b.include?(height + 1)
  b.delete_at(b.index(height + 1))
end

puts a
puts "newline end show"
puts b

# first an if block to make empty arrays equal to max + 1

# second if block has existing logic plus blocking bigger disc on smaller disc
