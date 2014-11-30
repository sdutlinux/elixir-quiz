defmodule Rlf do
  def compress(string) do
    String.codepoints(string) 
      |> encode 
      |> Enum.map(fn(x) -> num_str(x) end)
      |> Enum.join
  end

  # [a,a,a,a,b,c,c,a,a,d,e,e,e,e]
  # [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]
  defp encode([]), do: []
  defp encode([h | []]), do: [[h]]

  defp encode([h, h | c]) do
    [head | tail] = encode([h | c])
    [[h | head] | tail]
  end

  defp encode([h, h2 | c]) do 
    if h != h2 do 
      [[h] | encode([h2 | c])]
    end
  end

  # ["a", "a", "a"] => "3a"
  defp num_str([head | tail]) do
    "#{length(tail) + 1}" <> head
  end
end 
