defmodule MyList do
  def span(from, to) when from == to do
    [to]
  end

  def span(from, to) when from < to do
    [from | span(from + 1, to)]
  end

  def span(from, to) when from > to do
    [from | span(from - 1, to)]
  end


  def getPrimes(2, n) do
    list = span(2, n)
    result = for x <- list, 6*x + 1 <= n, rem(6*x + 1, 3) != 0, rem(6*x + 1, 5) != 0, rem(6*x + 1, 7) != 0, do: 6*x + 1
    result2 = for x <- list, 6*x - 1 <= n, rem(6*x - 1, 3) != 0, rem(6*x - 1, 5) != 0, rem(6*x - 1, 7) != 0, do: 6*x - 1
    [2,3,5 | result ++ result2]
    |>Enum.sort()
  end
end
