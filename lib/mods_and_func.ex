defmodule ModsAndFunc do

  # Modules and functions - 4

  def sum(n), do: sum(n, 0)
  defp sum(0, acc), do: acc
  defp sum(n, acc) do
    sum(n-1, n+acc)
  end

  # Modules and functions - 5

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))

  # Modules and functions - 6

  def guess(act, a..b) do
    guess(act, a..b, b)
  end

  def guess(act, _, g)
  when act == g do
    IO.puts "It is #{g}"
  end

  def guess(act, a..b, _g)
  when act > (a + div((b-a), 2)) do
    guess(act, div(b, 2)..b, div(b, 2))
  end

  def guess(act, a..b, _g)
  when act < (a + div((b-a), 2)) do
    guess(act, (a + div((b-a), 2))..b, div(b, 2))
  end

  # Bubble sort

  def bsort([]), do: []
  def bsort([a, b | tail])
  when a > b do
    [b,a | bsort(tail)]
  end
  def bsort([a, b | tail])
  when a <= b do
    [a,b | bsort(tail)]
  end
  
end
