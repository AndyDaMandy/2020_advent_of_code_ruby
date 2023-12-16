# frozen_string_literal: true

=begin
+++ Day 1: Trebuchet?! +++

...continued:

You try to ask why they can't just use a weather machine ("not powerful enough") and where they're even sending you ("the sky") and why your map looks mostly blank ("you sure ask a lot of questions") and hang on did you just say the sky ("of course, where do you think snow comes from") when you realize that the Elves are already loading you into a trebuchet ("please hold still, we need to strap you in").

As they're making the final adjustments, they discover that their calibration document (your puzzle input) has been amended by a very young Elf who was apparently just excited to show off her art skills. Consequently, the Elves are having trouble reading the values on the document.

The newly+improved calibration document consists of lines of text; each line originally contained a specific calibration value that the Elves now need to recover. On each line, the calibration value can be found by combining the first digit and the last digit (in that order) to form a single two+digit number.

For example:

1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet

In this example, the calibration values of these four lines are 12, 38, 15, and 77. Adding these together produces 142.

Consider your entire calibration document. What is the sum of all of the calibration values?
=end

# require './inputs/Day 1 Input.txt'

day_one_input = IO.readlines('./inputs/Day 1 Input.txt')

# Part 1
def sum(input)
  #list_arr = input.split("\n")
  list_arr = input
  sum = 0
  list_arr.each do |line|
    small_line = line.split("")
    first = 0
    last = 0
    small_line.each do |val|
      int = Integer(val) rescue nil
      if int != nil
        first = val
        break
      end
    end
    small_line.reverse_each do |val|
      int = Integer(val) rescue nil
      if int != nil
        last = val
        break
      end
    end
    final = [first.to_s, last.to_s]
    final = final.join("")
    final = final.to_i
    sum = sum + final
  end
  puts sum
  sum
end

sum(day_one_input)

# Part 2
=begin
Your calculation isn't quite right. It looks like some of the digits are actually spelled out with letters: one, two, three, four, five, six, seven, eight, and nine also count as valid "digits".

Equipped with this new information, you now need to find the real first and last digit on each line. For example:

two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen

In this example, the calibration values are 29, 83, 13, 24, 42, 14, and 76. Adding these together produces 281.

What is the sum of all of the calibration values?
=end

def sum2(input)
  #list_arr = input.split("\n")
  list_arr = input
  sum = 0
  list_arr.each do |line|
    small_line = line.split("")
    first = 0
    last = 0
    small_line.each_with_index do |val, index|
      int = Integer(val) rescue nil
      if val == "o"
        if small_line[index + 1] == "n" && small_line[index + 2] == "e"
          first = 1
          break
        end
      elsif val == "t"
        if small_line[index + 1] == "w" && small_line[index + 2] == "o"
          first = 2
          break
        elsif small_line[index + 1] == "h" && small_line[index + 2] == "r" && small_line[index + 3] == "e" && small_line[index + 4] == "e"
          first = 3
          break
          end
      elsif val == "f"
        if small_line[index + 1] == "o" && small_line[index + 2] == "u" && small_line[index + 3] == "r"
          first = 4
          break
        elsif small_line[index + 1] == "i" && small_line[index + 2] == "v" && small_line[index + 3] == "e"
          first = 5
          break
        end
      elsif val == "s"
        if small_line[index + 1] == "i" && small_line[index + 2] == "x"
          first = 6
          break
        elsif small_line[index + 1] == "e" && small_line[index + 2] == "v" && small_line[index + 3] == "e" && small_line[index + 4] == "n"
          first = 7
          break
        end
      elsif val == "e"
        if small_line[index + 1] == "i" && small_line[index + 2] == "g" && small_line[index + 3] == "h" && small_line[index + 4] == "t"
          first = 8
          break
        end
      elsif val == "n"
        if small_line[index + 1] == "i" && small_line[index + 2] == "n" && small_line[index + 3] == "e"
          first = 9
          break
        end
      elsif int != nil
        first = val
        break
      end
    end
    small_line_reversed = small_line.reverse
    small_line_reversed.each_with_index do |val, index|
      int = Integer(val) rescue nil
      if val == "o"
        if small_line_reversed[index + 1] == "w" && small_line_reversed[index + 2] == "t"
          last = 2
          break
        end
      elsif val == "e"
        if small_line_reversed[index + 1] == "n" && small_line_reversed[index + 2] == "o"
          last = 1
          break
        elsif small_line_reversed[index + 1] == "e" && small_line_reversed[index + 2] == "r" && small_line_reversed[index + 3] == "h" && small_line_reversed[index + 4] == "t"
          last = 3
          break
        elsif small_line_reversed[index + 1] == "v" && small_line_reversed[index + 2] == "i" && small_line_reversed[index + 3] == "f"
          last = 5
          break
        elsif small_line_reversed[index +1] == "n" && small_line_reversed[index + 2] == "i" && small_line_reversed[index + 3] == "n"
          last = 9
          break
        end
      elsif val == "r"
        if small_line_reversed[index + 1] == "u" && small_line_reversed[index + 2] == "o" && small_line_reversed[index + 3] == "f"
          last = 4
          break
        end
      elsif val == "x"
        if small_line_reversed[index +1 ] == "i" && small_line_reversed[index + 2] == "s"
          last = 6
          break
        end
      elsif val == "n"
        if small_line_reversed[index +1] == "e" && small_line_reversed[index + 2] == "v" && small_line_reversed[index + 3] == "e" && small_line_reversed[index + 4] == "s"
          last = 7
          break
        end
      elsif val == "t"
        if small_line_reversed[index + 1] == "h" && small_line_reversed[index + 2] == "g" && small_line_reversed[index + 3] == "i" && small_line_reversed[index + 4] == "e"
          last = 8
          break
        end
      elsif int != nil
        last = val
        break
      end
    end
    final = [first.to_s, last.to_s]
    final = final.join("")
    final = final.to_i
    sum = sum + final
  end
  puts sum
  sum
end

sum2(day_one_input)