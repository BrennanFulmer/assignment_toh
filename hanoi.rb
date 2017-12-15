
=begin
  Documents/Viking/Ruby/Hanoi

  improve visuals in render

  usual checklist finishing touches
=end

class Hanoi
  def initialize
    @a = []
    @b = []
    @c = []
    @solution = []
    @height = 0
    system "cls"
    system "clear"
    puts "\n||_Tower of Hanoi_||"
    puts "\nThe objective of the Tower of Hanoi game is to move all the pieces from the first area to the third"
    puts "\nThe rules are:"
    puts "1. You can only move one piece at a time"
    puts "2. During each move you take a piece from the top of a stack to the top of another stack"
    puts "3. A piece cannot be placed onto one that is smaller"
    puts "\n||_Tower of Hanoi_||"
    setHeight
  end

  def setHeight
    puts "\nHow many disks would you like there to be in the tower? "
    puts "(Note: more disks means more difficult)\n\n"
    @height = gets.chomp.to_i
    if @height < 0
     puts "Please enter a number greater than 0"
     setHeight
    end
    build
  end

  def build
    disk = 1
    while disk <= @height
      @solution << disk
      @a << disk
      disk += 1
    end
    play
  end

=begin
 make the display prettier, note you don't have to store it how you show it
 iterate through the values of each array and multiply them by "o" then push that into a new local only display array
 dont forget to make the border/framing better looking
=end

  def render
    puts "\n||_Tower of Hanoi_||\n\n"
    puts @a
    puts "\n-A-\n"
    puts @b
    puts "\n-B-\n"
    puts @c
    puts "\n-C-\n"
    puts "\n||_Tower of Hanoi_||\n"
  end

  def move
    print "\nEnter where you'd like to move from "
    from = gets.chomp
    if from == "quit"
      exit
    end
    print "\nEnter where you'd like to move to "
    to = gets.chomp
      @c = [@height + 1] if @c == []
        @b = [@height + 1] if @b == []
          @a = [@height + 1] if @a == []
            if from == "a" && to == "b" && @a[0] < @b[0]
              @b.unshift(@a[0])
              @a.shift
            elsif from == "a" && to == "c" && @a[0] < @c[0]
              @c.unshift(@a[0])
              @a.shift
            elsif from == "b" && to == "c" && @b[0] < @c[0]
              @c.unshift(@b[0])
              @b.shift
            elsif from == "b" && to == "a" && @b[0] < @a[0]
              @a.unshift(@b[0])
              @b.shift
            elsif from == "c" && to == "a" && @c[0] < @a[0]
              @a.unshift(@c[0])
              @c.shift
            elsif from == "c" && to == "b" && @c[0] < @b[0]
              @b.unshift(@c[0])
              @c.shift
            elsif to == "quit"
              exit
            else
              puts "\nPlease either enter quit to end the game\nor one of the following letters when moving\na\nb\nc\nor remember that its against the rules to move a disk onto a smaller disk"
            end
              @c.delete_at(@c.index(@height + 1)) if @c.include?(@height + 1)
                @b.delete_at(@b.index(@height + 1)) if @b.include?(@height + 1)
                  @a.delete_at(@a.index(@height + 1)) if @a.include?(@height + 1)
  end

  def play
    while(@c != @solution)
      render
      move
    end
    render
    puts "\nyou won!\n\n"
  end

end

Hanoi.new
