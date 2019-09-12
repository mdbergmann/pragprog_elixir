defmodule ListsAndRecursion do

  # Lists and recursion - 1

  def mapsum(list, func) do
    mapsum(list, func, 0)
  end

  defp mapsum([], _, sum), do: sum
  defp mapsum([head | tail], func, sum) do
    head_func_val = func.(head)
    mapsum(tail, func, sum + head_func_val)
  end
  
  # Lists and recursion - 2

  def mmax(list), do: mmax(list, 0)
  defp mmax([], mmax), do: mmax
  defp mmax([head | tail], current_max)
  when head > current_max do
    mmax(tail, head)
  end
  defp mmax([head | tail], current_max)
  when head <= current_max do
    mmax(tail, current_max)
  end

  # Lists and recursion - 3

  def caesar([], _), do: []
  def caesar([head | tail], n)
  when ((n + head) <= hd('z')) do
    IO.puts "less than z: #{head}"
    [n+head | caesar(tail, n)]
  end
  def caesar([head | tail], n) do
    IO.puts "larger than z: #{(n+head)}"
    ['?' | caesar(tail, n)]
  end
  
  # Lists and recursion - 4

  def span(from, to), do: span(from, to, [])  
  def span(_from, 0, result), do: result
  def span(from, to, result) do
    span(from, to-1, [to] ++ result)
  end

  # Lists and recursion - 5

  def all?(list, func), do: all?(list, func, true)
  defp all?([head | tail], func, true), do: all?(tail, func, func.(head))
  defp all?([_|_], func, false), do: all?([], func, false)
  defp all?([], _, is_all), do: is_all

  def meach([head | tail], func) do
    func.(head)
    meach(tail, func)
  end
  def meach([], _), do: []

  def filter(list, func), do: filter(list, func, [])
  defp filter([], _, result), do: result
  defp filter([head | tail], func, result) do
    if func.(head) do
      filter(tail, func, result ++ [head])
    else
      filter(tail, func, result)
    end
  end

  def split(list, num), do: split(list, num, [])
  defp split([], _, first), do: [first, []]
  defp split(list, 0, first), do: [first, list]
  defp split([head | tail], num, first) do
    split(tail, num-1, first ++ [head])
  end

  def take(list, num), do: take(list, num, [])
  defp take([], _, result), do: result
  defp take(_, 0, result), do: result
  defp take([head | tail], num, result) do
    take(tail, num-1, result ++ [head])
  end

  # Lists and recursion - 6

  def flatten([]), do: []
  def flatten([head | _])
  when is_list(head) do
    flatten(head)
  end
  def flatten([head|tail]) do
    [head | flatten(tail)]
  end
  
  # Lists and recursion - 7

  def prime(n) do
    for n <- span(2, n), is_prime(n) do
      n
    end
  end
  defp is_prime(n) when n < 2, do: false
  defp is_prime(n) do
    devideable = for i <- 2..n-1 do
      rem(n, i) == 0
    end

    all?(devideable, &(&1 == false))
  end

  # Lists and recursion - 8

  def add_total(orders, tax_rates) do
    for order <- orders do
      order_with_tax(order[:ship_to], order, tax_rates, order[:net_amount])
    end
  end
  defp order_with_tax(:NC, order, tax_rates, net_amount) do
    new_order_entry(net_amount, tax_rates[:NC], order)
  end
  defp order_with_tax(:TX, order, tax_rates, net_amount) do
    new_order_entry(net_amount, tax_rates[:TX], order)
  end
  defp order_with_tax(_, order, _, _), do: order

  defp new_order_entry(net_amount, tax_rate, order) do
     [{:total_amount, net_amount * tax_rate + net_amount} | order]
  end
  
end
