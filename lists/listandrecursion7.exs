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

    # a([2, 5])
    # b([2, 5])

    for a, b <- list, b <- list, a <= b and a * b <= n, do: a * b
  end
end
