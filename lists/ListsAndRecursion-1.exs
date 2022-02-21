defmodule MyList do
  def mapsum([], _fun), do: 0

  def mapsum([head | tail], fun) do
    fun.(head) + mapsum(tail, fun)
  end

  def max([]), do: 0

  def max(list = [head | tail]) do
    _max([head | tail], nil)
  end

  defp _max([], current_max), do: current_max

  defp _max([head | tail], current_max) when is_nil(current_max) do
    _max(tail, head)
  end

  defp _max([head | tail], current_max) when current_max > head do
    _max(tail, current_max)
  end

  defp _max([head | tail], current_max) when current_max <= head do
    _max(tail, head)
  end

  def caesar([], n), do: []

  def caesar([head | tail], n) do
    [_encode(head + n) | caesar(tail, n)]
  end

  defp _encode(code, n) when code > ?z do
    length_of_alphabet = 26

    position_in_alphabet =
      (code - ?a)
      |> rem(length_of_alphabet)

    position_in_alphabet + ?a
  end

  defp _encode(code) do
    code
  end
end
