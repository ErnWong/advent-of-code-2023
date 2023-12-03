#
# Part 1:
#

PartA ← (
  ▽≤@9. # Keep only number characters.

  # Partition by new lines, and for each line, get the
  # first and last characters, join them up, and parse into number
  ≠@\n.
  ⊜(parse⊏0_¯1)

  # Add the numbers up.
  /+
)

# Testing using the example:
---
$ 1abc2
$ pqr3stu8vwx
$ a1b2c3d4e5f
$ treb7uchet
⍤ "Day 1 example" =142 PartA
---

# Run with the real input.
PartA &fras "01.txt"

# 
# Part 2:
# 

Numbers ← (
  "one two three four five six seven eight nine"

  # Partition by space.
  ⊜□ ≠@ .

  # Create a corresponding array of numbers that matches the words.
  +1⇡⧻.

  # Join the numbers up with their corresponding words.
  ⇌⊟

  # Flip the matrix around.
  ⍉
)

ReplaceNumber ← (
  # This function accepts three stack inputs:
  # - The current [word - number] to replace
  # - The current semi-replaced string that we will use to
  #   continue replacing.
  # - The original string from which we search the number words.

  # First, duplicate the original string so we can use it without
  # consuming it.
  ⊙⊙.

  # Bring the original string to the front so we can search it.
  :⊙:

  # Get a copy of the [word - number] and bring it to the front
  # so we know what word to search for. We need the second copy
  # later on so we know what number to put back in.
  ,

  # Extract the word out of the [word - number] pair.
  ⊔⊢

  # Search.
  ⌕

  # Bring the second copy of [word - number] back to the front
  # and then make a copy of the search results, and negate one of them.
  # The negated one will be the mask for what characters to leave unchanged.
  ⊙⊙¬⊙.:

  # Extract the number out of the [word - number] pair, and use it
  # to scale the search result.
  ×⊔⊡1

  # Rearrange the stack again so we can apply the mask and set the new value.
  ⍜(-@0)(+×): ⊙: :
)

---
Test ← "eightwo"
Test Test
ReplaceNumber [□ "two" □ 2]
ReplaceNumber [□ "eight" □ 8]
⍤ "ReplaceNumber" ≍ "8igh2wo"
---

# Go through each number one by one and replace their word occurances
# in the string, then feed the result to the same algorithm for Part 1.
PartB ← PartA ⊙; ∧(ReplaceNumber) Numbers .

---
$ two1nine
$ eightwothree
$ abcone2threexyz
$ xtwone3four
$ 4nineeightseven2
$ zoneight234
$ 7pqrstsixteen
⍤ "Day 2 example" = 281 PartB
---

PartB &fras "01.txt"
