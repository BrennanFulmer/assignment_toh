
# Documents/Viking/Ruby/Hanoi

=begin
  Rules:
    1. Only one disk can be moved at a time.
    2. Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack.
    3. No disk may be placed on top of a smaller disk.
=end

input = 0
board = {}
inputy = 0

while input != "quit" || input == "win"
  if inputy == 0
    print "How many discs would you like there to be in the tower? "
    inputy = gets.chomp
    height = inputy.to_i
    spacing = " " * height
  end

# turn this into a method called initialBoard
  disc = 0
  while disc < height
    disc += 1
    size = ("o" * disc) + " " * (height - disc)
    board["disc#{disc}"] = size + spacing * 2
  end
  board["base"] = "1" + spacing + "2" + spacing + "3"

# turn this into a method called render, which should later be improved to make the display prettier
  disc = 0
  while disc < height
    disc += 1
    puts board["disc#{disc}"]
  end
  puts board["base"]

# create a method called winCondition which generates what the winning board would look like that converts input into "win" if true

# create a method to process moving discs, it needs to handle moves that are against the rules

  input = gets.chomp
end
