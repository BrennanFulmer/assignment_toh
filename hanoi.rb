
class Hanoi
  def initialize
    @height = 0
    @a = []
    @b = []
    @c = []
    @solution = []
    @moves = ["1", "2", "3"]
    rules
  end

  def rules
    system "cls"
    system "clear"
    puts "\n||_Tower of Hanoi_||"
    puts "\nThe objective of the Tower of Hanoi game is to move all the pieces from the first area to the third"
    puts "\nThe rules are:"
    puts "1. You can only move one piece at a time"
    puts "2. During each move you take a piece from the top of a stack to the top of another stack"
    puts "3. A piece cannot be placed onto one that is smaller"
    puts "\nAdditionally you can end the game early by typing quit for one of the prompts"
    puts "\n||_Tower of Hanoi_||"
    set_height
  end

  def set_height
    puts "\n (Note: more disks means more difficult, and decimals will be removed)"
    print "How many disks would you like there to be in the tower? "
    @height = gets.chomp
    quit(@height)
    valid_height
  end

  def quit(input)
    exit if input == "quit"
  end

  def valid_height
    @height = @height.to_i.ceil
    if @height < 1
     puts "Please enter a number equal to or greater than 1."
     set_height
    end
    build(@a)
    build(@solution)
    play
  end

  def build(column)
    @height.times do |disk|
      column << disk + 1
    end
  end

  def play
    while(@c != @solution)
      render
      point_a
    end
    render
    puts "\nyou won!\n\n"
    exit
  end

  def render
    column1, column2, column3 = [], [], []
    @a.each do |diskify|
      column1 << "o" * diskify
    end
    @b.each do |diskify|
      column2 << "o" * diskify
    end
    @c.each do |diskify|
      column3 << "o" * diskify
    end
    puts "\n||_Tower of Hanoi_||\n\n"
    puts column1
    puts "\n|_-1-_|\n\n"
    puts column2
    puts "\n|_-2-_|\n\n"
    puts column3
    puts "\n|_-3-_|\n"
    puts "\n||_Tower of Hanoi_||\n"
  end

  def point_a
    print "\nEnter where you'd like to move from. "
    @from = gets.chomp
    quit(@from)
    valid_move(@from)
    @from = convert(@from)
    empty
  end

  def valid_move(input)
    if !@moves.include?(input)
      puts "\nPlease enter one of the following numbers for moves\n1\n2\n3\nor enter quit to end the game"
      if input == @from
        point_a
      else
        point_b
      end
    end
  end

  def convert(move)
    if move == "3"
      move = @c
    elsif move == "2"
      move = @b
    elsif move == "1"
      move = @a
    end
  end

  def empty
    if @from.empty?
      puts "\nYou can't move a piece from an area without one, try again"
      point_a
    else
      point_b
    end
  end

  def point_b
    print "\nEnter where you'd like to move to. "
    @to = gets.chomp
    quit(@to)
    valid_move(@to)
    @to = convert(@to)
    same
  end

  def same
    if @from == @to
      puts "\nYou can't move a piece from and to the same area, try again"
      point_a
    else
      smaller
    end
  end

  def smaller
    if @to == []
      move
    elsif @from[0] < @to[0]
      move
    else
      puts "\nYou can't move a piece onto a smaller piece, try again"
      point_a
    end
  end

  def move
    @to.unshift(@from[0])
    @from.shift
    play
  end
end

Hanoi.new
