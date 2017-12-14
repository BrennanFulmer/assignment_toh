
# Documents/Viking/Ruby/Hanoi

=begin
  Rules:
    1. Only one disk can be moved at a time.
    2. Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack.
    3. No disk may be placed on top of a smaller disk.
=end

# need to display the rules/directions somewhere

# need to convert the whole thing to a class

a, b, c, solution = [], [], [], []
input, height, from, to = 0, 0, 0, 0

def build(height)
  print "How many discs would you like there to be in the tower? "
  # user input validation
  height = gets.chomp.to_i
  return height
end

def winCondition(height, solution, a)
  disc = 1
  while disc <= height
    size = ("o" * disc)
    solution << size
    a << size
    disc += 1
  end
  return solution, a
end

def render(a, b, c)
  puts "\n"
  puts a
  puts "\n-A-\n"
  puts b
  puts "\n-B-\n"
  puts c
  puts "\n-C-\n"
end

# needs to handle moves that are against the rules
def move(a, b, c, from, to, solution)
  print "\nEnter where you'd like to move from "
  from = gets.chomp
  print "\nEnter where you'd like to move to "
  to = gets.chomp
  if from == "a" && to == "b"
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
  elsif from == "quit" || to == "quit"
    exit
  else
    puts "\nPlease either enter quit to end the game or one of the following letters\na\nb\nc\n"
  end
  return a, b, c, from, to
end

# user input validation
height = build(height)

winCondition(height, solution, a)

while(c != solution)

  render(a, b, c)

# needs to handle moves that are against the rules
  move(a, b, c, from, to, solution)

end
puts "you won!"







# spacing
