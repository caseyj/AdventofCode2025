defmodule Days.Day8 do
  # %{{{abc}, {xyz}}=> 1}

  def pairwise_distances(points) do
    combinations(points)
    |> Enum.map(fn {current_left, current_right} ->
      {
        current_left,
        current_right,
        euclid_distance(current_left, current_right)
      }
    end)
    |> Enum.sort_by(&elem(&1, 2))
  end

  def combinations(list) do
    list
    |> Enum.with_index()
    |> Enum.flat_map(fn {a, i} ->
      Enum.drop(list, i + 1)
      |> Enum.map(fn b -> {a, b} end)
    end)
  end

  def euclid_distance(point_a, point_b) do
    point_a
    |> Enum.zip(point_b)
    |> Enum.map(fn {a, b} -> :math.pow(b - a, 2) end)
    |> Enum.sum()
    |> :math.sqrt()
  end

  def line_to_tuple(str) do
    String.split(str, ",")
    |> Enum.reduce([], fn number, acc ->
      acc ++ [Integer.parse(number) |> elem(0)]
    end)
    |> List.to_tuple()
  end
end
