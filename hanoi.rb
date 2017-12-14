
# Documents/Viking/Ruby/Hanoi

=begin
  Rules:
    1. Only one disk can be moved at a time.
    2. Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack.
    3. No disk may be placed on top of a smaller disk.
=end

# need to display the rules/directions somewhere

def winCondition(height, solution)
  disc = 1
  while disc <= height
    size = ("o" * disc)
    solution << size
    disc += 1
  end
  return solution
end

def render(a, b, c)
  system "cls"
  system "clear"
  puts a
  puts "\n-A-"
  puts b
  puts "\n-B-"
  puts c
  puts "\n-C-"
end

def move()
end

a, b, c, solution = [], [], [], []
input, height = 0, 0
print "How many discs would you like there to be in the tower? "
height = gets.chomp.to_i
# need to handle bad inputs
winCondition(height, solution)
a = solution

while input != "quit"
  if c == solution
    puts "you won!"
    exit
  end

render(a, b, c)

# create a method to process moving discs, it needs to handle moves that are against the rules
move()

  input = gets.chomp
# need to handle bad inputs
end








# spacing
