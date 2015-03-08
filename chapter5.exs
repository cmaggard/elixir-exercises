sep = fn ->
  IO.puts " "
  IO.puts "============="
  IO.puts " "
end


## Functions-1

list_concat = fn a, b -> a ++ b end
# #Function<12.90072148/2 in :erl_eval.expr/5>
list_concat.([:a, :b], [:c, :d])
# [:a, :b, :c, :d]

sum = fn a, b, c -> a + b + c end
# #Function<18.90072148/3 in :erl_eval.expr/5>
sum.(1,2,3)
# 6

pair_tuple_to_list = fn {a, b} -> [a, b] end
# #Function<6.90072148/1 in :erl_eval.expr/5>
pair_tuple_to_list.({1234, 5678})
# [1234, 5678]


sep.()
## Functions-2

fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, c -> c
end
IO.puts fizzbuzz.(0,0,2)
IO.puts fizzbuzz.(0,1,2)
IO.puts fizzbuzz.(1,0,2)
IO.puts fizzbuzz.(1,1,2)


sep.()
## Functions-3
calc_fizz = fn n ->
  fizzbuzz.(rem(n, 3), rem(n, 5), n)
end
IO.puts calc_fizz.(10)
IO.puts calc_fizz.(11)
IO.puts calc_fizz.(12)
IO.puts calc_fizz.(13)
IO.puts calc_fizz.(14)
IO.puts calc_fizz.(15)
IO.puts calc_fizz.(16)


sep.()
## Functions-4
prefix = fn str1 ->
  fn str2 -> str1 <> " " <> str2 end
end
mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")


sep.()
## Functions-5
IO.puts Enum.map [1,2,3,4], &(&1+2)
Enum.each [1,2,3,4], &(IO.inspect &1)
