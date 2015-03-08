sep = fn ->
  IO.puts " "
  IO.puts "============="
  IO.puts " "
end


## ListsAndRecursion-0
defmodule MyList do
  def sum([]), do: 0
  def sum([ h | t ]), do: h + sum(t)
end
IO.puts MyList.sum([1,2,3,4,5,6])


sep.()
## ListsAndRecursion-1
defmodule MyList do
  def mapsum(list, map_func) do
    Enum.reduce(list, &(&2 + map_func.(&1)))
  end
end
IO.puts MyList.mapsum([1,2,3], &(&1 * &1))


sep.()
## ListsAndRecursion-2
defmodule MyList do
  def max([h|t]) do
    _max(h, t)
  end

  def _max(init, list) do
    Enum.reduce(list, init, &_reducer(&1, &2))
  end
  def _reducer(a, b) when a >= b, do: a
  def _reducer(a, b) when a < b, do: b
end
IO.puts MyList.max([5,1,-2,5,4,8,1])


sep.()
## ListsAndRecursion-3
defmodule MyList do
  def caesar(list, n) do
    Enum.map list, &(rem(&1 - ?a + n, 26) + ?a)
  end
end
IO.puts MyList.caesar('helpme', 13)
IO.puts MyList.caesar(MyList.caesar('helpme', 13), 13)
