sep = fn ->
  IO.puts " "
  IO.puts "============="
  IO.puts " "
end


## ListsAndRecursion-5
defmodule MyEnum do
  def all?([], _), do: true
  def all?([h|t], f \\ &(&1)), do: f.(h) and all?(t)
  def each([], _), do: {:ok}
  def each([h|t], f) do
    f.(h)
    each(t, f)
  end
  def filter(coll, fun), do: _filter(coll, fun, [])
  def _filter([], _, res), do: res
  def _filter([h|t], fun, res) do
    if fun.(h) do
      _filter(t, fun, res ++ [h])
    else
      _filter(t, fun, res)
    end
  end
  def split(list, cnt), do: _split(list, cnt, [])
  def _split([h|t], 0, acc), do: [acc, [h | t]]
  def _split([h|t], v, acc), do: _split(t, v-1, acc ++ [h])
  def take(list, cnt), do: _take(list, cnt, [])
  def _take(list, 0, acc), do: acc
  def _take([h|t], cnt, acc), do: _take(t, cnt-1, acc ++ [h])
end
IO.puts MyEnum.all? [true, false]
IO.puts MyEnum.all? [true]
IO.puts MyEnum.all? []
MyEnum.each [1,2,3], &IO.puts(&1)
IO.inspect MyEnum.filter [1,2,3], &(&1 == 2)
IO.inspect MyEnum.split [0,1,2,3], 2
IO.inspect MyEnum.take [0,1,2,3], 3


sep.()
## ListsAndRecursion-6
defmodule MyEnum do
  def flatten([]), do: []
  def flatten([[h|t] | []]) do
    flatten([h] ++ t)
  end
  def flatten([[]|t]) do
    flatten(t)
  end
  def flatten([[h|t] | t2]) do
    flatten([h] ++ [t] ++ [t2])
  end
  def flatten([h | []]) do
    [h]
  end
  def flatten([h | t]) do
    [h] ++ flatten(t)
  end
end
IO.inspect MyEnum.flatten [1, [2,3]]
IO.inspect MyEnum.flatten [1, [2,3, [4]], 5, [[[6]]]]


sep.()
## ListsAndRecursion-7
defmodule MyList do
  def span(from, to), do: _span(from, to, [])
  def _span(from, to, lst) when from > to, do: lst
  def _span(from, to, lst), do: _span(from+1, to, lst ++ [from])
end
defmodule MyMath do
  def is_prime?(n) do
    !(Enum.any? MyList.span(2, :math.sqrt(n)), &(rem(n,&1) == 0))
  end
  def primes(n) do
    for x <- MyList.span(2, n), is_prime?(x), do: x
  end
end
IO.inspect MyMath.primes 30


sep.()
## ListsAndRecursion-8
tax_rates = [NC: 0.075, TX: 0.08]
orders = [
  [id: 123, ship_to: :NC, net_amount: 100.00],
  [id: 124, ship_to: :OK, net_amount: 35.50],
  [id: 125, ship_to: :TX, net_amount: 24.00],
  [id: 126, ship_to: :TX, net_amount: 44.80],
  [id: 127, ship_to: :NC, net_amount: 25.00],
  [id: 128, ship_to: :MA, net_amount: 10.00],
  [id: 129, ship_to: :CA, net_amount: 102.00],
  [id: 120, ship_to: :NC, net_amount: 50.00]
]
calculate_tax = fn ords, rates ->
  for ord <- ords do
    res = [ id: ord[:id],
      ship_to: ord[:ship_to],
      net_amount: ord[:net_amount],
      total_amount: ord[:net_amount]]
    if rates |> Dict.keys |> Enum.any? &(&1 == ord[:ship_to]) do
      res = res ++ [total_amount: res[:total_amount] * (1 + rates[ord[:ship_to]])]
    end
    res
  end
end

IO.inspect calculate_tax.(orders, tax_rates)
