
def render()
end

def move()
end

input = 0
height = 0
print "How many discs would you like there to be in the tower? "
height = gets.chomp.to_i
# need to handle bad inputs

# create a method to generate win condition based on tower height

while input != "quit"

# need to adjust to match new approach
  if board == winCondition
    puts "you won!"
    exit
  end

render()

# create a method to process moving discs, it needs to handle moves that are against the rules
move()

  input = gets.chomp
# need to handle bad inputs
end
