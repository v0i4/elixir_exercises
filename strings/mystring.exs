defmodule MyString do
 def printable_ascii(sqs), do: Enum.all?(sqs, fn ch -> ch in ? ..?~ end)

 def is_anagram(word1, word2) do
   w1 = word1
   |>String.downcase()
   |>String.to_charlist()
   |>Enum.sort()

   w2 = word2
   |>String.downcase()
   |>String.to_charlist()
   |>Enum.sort()

   case w1 == w2 do
     true -> true
     false -> false
   end
 end
 end
