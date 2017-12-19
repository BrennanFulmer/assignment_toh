
class Hanoi
  def initialize
    @height = 0
    @a = []
    @b = []
    @c = []
    @solution = []
    @moves = [1, 2, 3]
    rule
  end

  def rule
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
    check_height
  end

  def quit_check(input)
    if input == "quit"
      exit
    end
  end

  def check_height
    quit_check(@height)
    @height = @height.to_i.ceil
    if @height < 1
     puts "Please enter a number equal to or greater than 1."
     set_height
    end
    build
  end

  def build
    (@height + 1).times do |disk|
      @a << disk
      @solution << disk
    end
    play
  end

  def render
    a_board, b_board, c_board = [], [], []
    @a.each do |diskify|
      a_board << "o" * diskify
    end
    @b.each do |diskify|
      b_board << "o" * diskify
    end
    @c.each do |diskify|
      c_board << "o" * diskify
    end
    puts "\n||_Tower of Hanoi_||\n\n"
    puts a_board
    puts "\n|_-1-_|\n\n"
    puts b_board
    puts "\n|_-2-_|\n\n"
    puts c_board
    puts "\n|_-3-_|\n"
    puts "\n||_Tower of Hanoi_||\n"
  end

  def get_move
    print "\nEnter where you'd like to move from. "
    @from = gets.chomp
    quit_check(@from)
    print "\nEnter where you'd like to move to. "
    @to = gets.chomp
    check_move
  end

  def check_move
    quit_check(@to)
    @to = @to.to_i
    @from = @from.to_i
    if !@moves.include?(@from) || !@moves.include?(@to)
      puts "\nPlease enter one of the following numbers for moves\n1\n2\n3\nor enter quit to end the game"
      get_move
    elsif @from == 3 && @c.empty?
      puts "\nYou can't move a disk from an area without one, try again"
      get_move
    elsif @from == 2 && @b.empty?
      puts "\nYou can't move a disk from an area without one, try again"
      get_move
    elsif @from == 1 && @a.empty?
      puts "\nYou can't move a disk from an area without one, try again"
      get_move
    else
      move
    end
  end

  def move
    @c = [@height + 1] if @c == []
      @b = [@height + 1] if @b == []
        @a = [@height + 1] if @a == []
          if @from == 1 && @to == 2 && @a[0] < @b[0]
            @b.unshift(@a[0])
            @a.shift
          elsif @from == 1 && @to == 3 && @a[0] < @c[0]
            @c.unshift(@a[0])
            @a.shift
          elsif @from == 2 && @to == 3 && @b[0] < @c[0]
            @c.unshift(@b[0])
            @b.shift
          elsif @from == 2 && @to == 1 && @b[0] < @a[0]
            @a.unshift(@b[0])
            @b.shift
          elsif @from == 3 && @to == 1 && @c[0] < @a[0]
            @a.unshift(@c[0])
            @c.shift
          elsif @from == 3 && @to == 2 && @c[0] < @b[0]
            @b.unshift(@c[0])
            @c.shift
          else
            puts "\nIts against the rules to move a disk onto a smaller disk, try again"
            get_move
          end
            @c.delete_at(@c.index(@height + 1)) if @c.include?(@height + 1)
              @b.delete_at(@b.index(@height + 1)) if @b.include?(@height + 1)
                @a.delete_at(@a.index(@height + 1)) if @a.include?(@height + 1)
  end

  def play
    while(@c != @solution)
      render
      get_move
    end
    render
    puts "\nyou won!\n\n"
  end

end

Hanoi.new
