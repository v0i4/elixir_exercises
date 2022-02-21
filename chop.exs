defmodule Chop do
  def halfway(a..b = range) when a == 1 or a == 0 do
    div(b, 2)
  end

  def halfway(a..b = range) do
    dif = a + (b - a) / 2
  end

  def run(answer, range, current) do
    current = halfway(range)
    check_and_update(answer, range, current)
  end

  def check_and_update(answer, a..b = range, current) when current > answer and a <= b do
    # IO.puts("range #{a}, #{b}")
    IO.puts("guessing #{current}")

    range = a..trunc(current)
    run(answer, range, current)
  end

  def check_and_update(answer, a..b = range, current) when current < answer and a <= b do
    # IO.puts("range #{a}, #{b}")
    IO.puts("guessing #{current}")

    range = trunc(current)..b
    run(answer, range, current)
  end

  def check_and_update(answer, a..b = range, current) do
    IO.puts("thats your answer!!  #{current} ")
  end

  def guess(answer, range) do
    run(answer, range, halfway(range))
  end
end
