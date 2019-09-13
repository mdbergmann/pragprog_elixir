defmodule StringsAndBinaries do

  require Integer
  
  # Strings and binaries - 1
  
  def printable?(chars) do
    Enum.all?(chars, fn c ->
      c in ?_..?~
    end)
  end

  # Strings and binaries - 2

  def anagram?(word1, word2) do
    word1 == Enum.reverse(word2)
  end

  # Strings and binaries - 4 (calculate(’123 + 27’) # => 150)

  def calculate(chars) do
    {op, nums} = Enum.split_with(chars, fn c -> c in '+-*/' end)
    [{first_num, _}, {second_num, _}] = nums
    |> to_string
    |> String.split
    |> Enum.map(fn n -> Integer.parse(n) end)

    _calculate(op, first_num, second_num)
  end

  defp _calculate('+', first_num, second_num), do: first_num + second_num
  defp _calculate('-', first_num, second_num), do: first_num - second_num
  defp _calculate('*', first_num, second_num), do: first_num * second_num
  defp _calculate('/', first_num, second_num), do: first_num / second_num

  # Strings and binaries - 5

  def center(strings) do
    max_len = Enum.map(strings, &(String.length(&1))) |> Enum.max

    Enum.each(strings, fn s ->
      str_len = String.length(s)
      pad = div(max_len - str_len, 2)

      s
      |> String.pad_leading(str_len+pad)
      |> String.pad_trailing(max_len)
      |> IO.inspect
      
    end
    )
  end

  # Strings and binaries - 6

  def cap_s(string) do
    string
    |> String.split(". ")
    |> Enum.filter(&(String.length(&1) > 0))
    |> Enum.map(fn s ->
      <<start_c::utf8, rest::binary>> = s
      <<String.upcase(to_string([start_c]))::binary, String.downcase(rest)::binary, ". "::binary>>
    end
    )
    |> Enum.join
  end

  # Strings and binaries - 7

  def read_tax_file(path) do
    Stream.resource(
      fn -> File.open!(path) end,
      fn file ->
        case IO.read(file, :line) do
          <<line::binary>> -> process_line(line)
          _ -> []
        end
      end,
      fn file -> File.close(file) end)
  end

  defp process_line(line) do
    {id_str, ship_to_str, net_amount_str} = line |> String.split(",") |> List.to_tuple()

    [id: String.to_integer(id_str),
     ship_to: String.to_atom(String.trim_leading(ship_to_str, ":")),
     net_amount: String.to_float(net_amount_str)]
  end  
  
end

