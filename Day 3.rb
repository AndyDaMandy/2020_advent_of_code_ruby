=begin
--- Day 3: Gear Ratios ---

You and the Elf eventually reach a gondola lift station; he says the gondola lift will take you up to the water source, but this is as far as he can bring you. You go inside.

It doesn't take long to find the gondolas, but there seems to be a problem: they're not moving.

"Aaah!"

You turn around to see a slightly-greasy Elf with a wrench and a look of surprise. "Sorry, I wasn't expecting anyone! The gondola lift isn't working right now; it'll still be a while before I can fix it." You offer to help.

The engineer explains that an engine part seems to be missing from the engine, but nobody can figure out which one. If you can add up all the part numbers in the engine schematic, it should be easy to work out which part is missing.

The engine schematic (your puzzle input) consists of a visual representation of the engine. There are lots of numbers and symbols you don't really understand, but apparently any number adjacent to a symbol, even diagonally, is a "part number" and should be included in your sum. (Periods (.) do not count as a symbol.)

Here is an example engine schematic:

467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..

In this schematic, two numbers are not part numbers because they are not adjacent to a symbol: 114 (top right) and 58 (middle right). Every other number is adjacent to a symbol and so is a part number; their sum is 4361.

Of course, the actual engine schematic is much larger. What is the sum of all of the part numbers in the engine schematic?

=end

day_three_input = IO.readlines('./inputs/Day 3 Input.txt')

#-- Part 1 --

# each line is 140 characters each. We need to check the perimeter of the number and the array above and below at the position. We need to save the number teporarily then check indexes above and below (+1 and -1)
# importantly we can't go below 0 so we need to be sure that the first index isn't 0 for the number
LINE_LENGTH = 140

# allows us to identify if a character is also an int
class String
  def number?
    Integer(self).is_a?(Integer)
  rescue ArgumentError, TypeError
    false
  end

  def special_char?
    /[^0-9a-zA-Z\. ]/ === self
  rescue ArgumentError, TypeError
    false
  end

end


def minesweeper(input)
  sum = 0
  # to remove bounds we add 2 lines to the top and bottom
  input.push("........................................................................................")
  input.unshift(".....................................................................................")
  input.each_with_index do |line,index|
    arr = line.split('')
    # we do the same with each line
    arr.push(".")
    arr.unshift(".")
    arr.each_with_index do |char, second_index|
      number_string_arr = []
      number_location = []
      if char.number?
        number_string_arr.push(char)
        number_location.push(second_index)
      elsif char.number? && arr[second_index + 1] == "."
        # we now start checking if there are any values above or below +/- one index
      end
      if char.special_char?
        puts char
      end
      puts number_location
    end
  end

end

minesweeper(
  [
    "............409..........784...578...802......64..............................486.248..............177....................369...............",
    ".....-939..........524#...#....=.......*.........+......90.................................76..615..-..@.....961..........$.......*.........",
    "............951*........................736...955..258....*.....253@.............210.10.....=...*.......776...*....&...............600..274."
  ]
)

