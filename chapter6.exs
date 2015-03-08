sep = fn ->
  IO.puts " "
  IO.puts "============="
  IO.puts " "
end


## ModulesAndFunctions-1-3
defmodule Times do
  def double(n) do
    n * 2
  end
  def triple(n) do
    n * 3
  end
  def quadruple(n) do
    double(n) * 2
  end
end
IO.puts Times.triple(259)
IO.puts Times.quadruple(64)


sep.()

defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n-1)
end
IO.puts Factorial.of(3)
IO.puts Factorial.of(7)
IO.puts Factorial.of(10)
IO.puts Factorial.of(1000)


sep.()
## ModulesAndFunctions-4-5
defmodule Mathemagic do
  def sum(1), do: 1
  def sum(n), do: n + sum(n-1)

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x,y))
end
IO.puts Mathemagic.sum(1000)
IO.puts Mathemagic.gcd(45, 75)


sep.()
## ModulesAndFunctions-6
defmodule Chop do
  def guess(target, lb..ub) do
    current = lb + div(ub-lb, 2)
    IO.puts "Is it #{current}"
    eval_guess(target, current, lb..ub)
  end
  def eval_guess(target, current, _) when target == current do
    IO.puts current
  end
  def eval_guess(target, current, _..ub) when target > current do
    guess(target, (current+1)..ub)
  end
  def eval_guess(target, current, lb.._) when target < current do
    guess(target, lb..(current-1))
  end
end
Chop.guess(273, 1..1000)
