PartA ← /+ ⊜(parse⊏0_¯1) ≠@\n. ▽≤@9.

---
$ 1abc2
$ pqr3stu8vwx
$ a1b2c3d4e5f
$ treb7uchet
⍤ "Day 1 example" =142 PartA
---

PartA &fras "01.txt"

Numbers ← ⍉ ⇌⊟+1⇡⧻. ⊜□ ≠@ . "one two three four five six seven eight nine"
ReplaceNumber ← +@0+×-@0: ⊙: : ×⊔⊡1 ⊙⊙¬⊙.: ⌕⊔⊢ ,:⊙:⊙⊙.

---
Test ← "eightwo"
Test Test
ReplaceNumber [□ "two" □ 2]
ReplaceNumber [□ "eight" □ 8]
⍤ "ReplaceNumber" ≍ "8igh2wo"
---

PartB ← ⊙; PartA ∧(ReplaceNumber) Numbers .

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
