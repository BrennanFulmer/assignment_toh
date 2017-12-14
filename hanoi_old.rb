
# Documents/Viking/Ruby/Hanoi

=begin
  Rules:
    1. Only one disk can be moved at a time.
    2. Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack.
    3. No disk may be placed on top of a smaller disk.
=end

def initialBoard(height, spacing, board)
  disc = 0
  while disc < height
    disc += 1
    size = ("o" * disc) + " " * (height - disc)
    board["disc#{disc}"] = size + spacing * 2
  end
  board["base"] = "1" + spacing + "2" + spacing + "3"
  return board
end

def winCondition(height, spacing, winCondition)
  disc = 0
  while disc < height
    disc += 1
    size = ("o" * disc) + " " * (height - disc)
    winCondition["disc#{disc}"] = spacing * 2 + size
  end
  winCondition["base"] = "1" + spacing + "2" + spacing + "3"
  return winCondition
end

def move()
end

# make this create a prettier display later
def render(height, board)
  system "cls" + "clear"
  disc = 0
  while disc < height
    disc += 1
    puts board["disc#{disc}"]
  end
  puts board["base"]
end

# this will become initialize in the class version
input = 0
board = {}
inputy = 0
winCondition = {}
print "How many discs would you like there to be in the tower? "
inputy = gets.chomp
height = inputy.to_i
spacing = " " * height
initialBoard(height, spacing, board)
winCondition(height, spacing, winCondition)

while input != "quit"

  if board == winCondition
    puts "you won!"
    exit
  end

  render(height, board)

# create a method to process moving discs, it needs to handle moves that are against the rules

  input = gets.chomp
end














# spacing
