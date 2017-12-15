
# Documents/Viking/Ruby/Hanoi

=begin
  Rules:
    1. Only one disk can be moved at a time.
    2. Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack.
    3. No disk may be placed on top of a smaller disk.
=end

# need to display the rules/directions at the start

# need to convert the whole thing into a class

a, b, c, solution = [], [], [], []
height = 0

def setHeight(height)
  print "How many disks would you like there to be in the tower? "
  height = gets.chomp.to_i
  if height > 0
   return height
  else
   puts "Please enter a number greater than 0"
   setHeight(height)
  end
end

def build(height, solution, a)
  disk = 1
  while disk <= height
    solution << disk
    a << disk
    disk += 1
  end
  return solution, a
end

# make the display prettier, note you don't have to store it how you show it
def render(a, b, c)
  puts "\n"
  puts "Tower Of Hanoi\n"
  puts a
  puts "\n-A-\n"
  puts b
  puts "\n-B-\n"
  puts c
  puts "\n-C-\n"
    puts "Tower Of Hanoi\n"
end

def move(a, b, c, height)
  print "\nEnter where you'd like to move from "
  from = gets.chomp
  if from == "quit"
    exit
  end
  print "\nEnter where you'd like to move to "
  to = gets.chomp
  c = [height + 1] if c == []
    b = [height + 1] if b == []
      a = [height + 1] if a == []
        if from == "a" && to == "b" && a[0] < b[0]
          b.unshift(a[0])
          a.shift
        elsif from == "a" && to == "c" && a[0] < c[0]
          c.unshift(a[0])
          a.shift
        elsif from == "b" && to == "c" && b[0] < c[0]
          c.unshift(b[0])
          b.shift
        elsif from == "b" && to == "a" && b[0] < a[0]
          a.unshift(b[0])
          b.shift
        elsif from == "c" && to == "a" && c[0] < a[0]
          a.unshift(c[0])
          c.shift
        elsif from == "c" && to == "b" && c[0] < b[0]
          b.unshift(c[0])
          c.shift
        elsif to == "quit"
          exit
        else
          puts "\nPlease either enter quit to end the game\nor one of the following letters when moving\na\nb\nc\n\nor remember that its against the rules to move a disk onto a smaller disk"
        end
        c.delete_at(c.index(height + 1)) if c.include?(height + 1)
          b.delete_at(b.index(height + 1)) if b.include?(height + 1)
            a.delete_at(a.index(height + 1)) if a.include?(height + 1)
              return a, b, c
end

height = setHeight(height)
solution, a = build(height, solution, a)

while(c != solution)
  render(a, b, c)
  a, b, c = move(a, b, c, height)
end

render(a, b, c)
puts "\nyou won!"







# spacing
