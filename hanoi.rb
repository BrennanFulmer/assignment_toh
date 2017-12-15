
class Hanoi
  def initialize
    @a = []
    @b = []
    @c = []
    @solution = []
    @height = 0
    instructions
  end

  def instructions
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
    puts "\nHow many disks would you like there to be in the tower? "
    puts "(Note: more disks means more difficult, and decimals will be removed)\n\n"
    @height = gets.chomp
    check_height
  end

  def check_height
    if @height == "quit"
      exit
    end
    @height = @height.to_i.ceil
    if @height < 1
     puts "Please enter a number equal to or greater than 1."
     set_height
    end
    build
  end

  def build
# this method both sets up the initial board, and sets what the winning board should look like
    disk = 1
    while disk <= @height
      @a << disk
      @solution << disk
      disk += 1
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
    if @from == "quit"
      exit
    end
    print "\nEnter where you'd like to move to. "
    @to = gets.chomp
    check_move
  end

  def check_move
    @c = [@height + 1] if @c == []
      @b = [@height + 1] if @b == []
        @a = [@height + 1] if @a == []
          if @from == "1" && @to == "2" && @a[0] < @b[0]
            @b.unshift(@a[0])
            @a.shift
          elsif @from == "1" && @to == "3" && @a[0] < @c[0]
            @c.unshift(@a[0])
            @a.shift
          elsif @from == "2" && @to == "3" && @b[0] < @c[0]
            @c.unshift(@b[0])
            @b.shift
          elsif @from == "2" && @to == "1" && @b[0] < @a[0]
            @a.unshift(@b[0])
            @b.shift
          elsif @from == "3" && @to == "1" && @c[0] < @a[0]
            @a.unshift(@c[0])
            @c.shift
          elsif @from == "3" && @to == "2" && @c[0] < @b[0]
            @b.unshift(@c[0])
            @c.shift
          elsif @to == "quit"
            exit
          else
            puts "\nPlease either enter quit to end the game,\n"
            puts "\none of the following numbers for moves\n1\n2\n3"
            puts "\nor remember that its against the rules to move a disk onto a smaller disk,"
            puts "\nand that you can't move a disk from an area without one"
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
