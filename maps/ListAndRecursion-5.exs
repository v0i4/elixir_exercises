defmodule MyEnum do
  def all?([]), do: true
  def all?([], fun), do: true

  def all?([head | tail], fun) do
    cond do
      Regex.match?(~r/^\d+$/, "#{head}") == false or fun.(head) == false ->
        false

      true ->
        fun.(head)
        all?(tail, fun)
    end
  end

  def each([], fun), do: :ok

  def each([head | tail], fun) do
    fun.(head)
    each(tail, fun)
  end

  def each(x, fun), do: fun.(x)

  def do_filter([], fun, res), do: Enum.reverse(res)

  def do_filter([head | tail], fun, res) do
    case fun.(head) do
      true -> do_filter(tail, fun, [head | res])
      false -> do_filter(tail, fun, res)
    end
  end

  def filter([head | tail], fun) do
    do_filter([head | tail], fun, res = [])
  end

  def filter([], fun), do: []

  def split(list, count) do
    case count < 0 do
      true -> _split(do_reverse(list), [], count, true)
      false -> _split(list, [], count)
    end
  end

  defp _split([], front, _) do
    [Enum.reverse(front), []]
  end

  defp _split([], back, _, true) do
    [do_reverse(back), []]
  end

  defp _split(tail, front, 0) do
    [do_reverse(front), tail]
  end

  defp _split(tail, back, 0, true) do
    [do_reverse(tail), back]
  end

  defp _split([head | tail], front, count) when count > 0 do
    _split(tail, [head | front], count - 1)
  end

  defp _split([head | tail], back, count, is_backwards = true) when count < 0 do
    _split(tail, [head | back], count + 1, true)
  end

  defp do_reverse(list), do: Enum.reverse(list)

  def take(list, count), do: hd(split(list, count))

  def flatten(list) do
    _flatten(list, [])
  end

  defp _flatten(list = [h | t], tail) when h |> is_list do
    _flatten(h, _flatten(t, tail))
  end

  defp _flatten(list = [h | t], tail) do
    [h | _flatten(t, tail)]
  end

  defp _flatten([], tail), do: tail
end
