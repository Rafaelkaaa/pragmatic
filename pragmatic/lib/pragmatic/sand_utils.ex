defmodule Pragmatic.SandUtils do
  def count_sand(length, width, depth) do
    (to_float(length) * to_float(width) * to_float(depth) * 7.3)
    |> Float.round(1)
  end

  defp to_float(value) when is_binary(value) do
    case Float.parse(value) do
      {float, _} -> float
      :error -> 0.0
    end
  end

  def count_price(0.0), do: nil

  def count_price(wight) when is_float(wight) do
    Float.round(wight * 0.2, 1)
  end
end
