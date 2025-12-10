defmodule Days.Day9 do
  def pairwise_area(points) do
    combinations(points)
    |> Enum.map(fn [current_left, current_right] ->
      {
        current_left,
        current_right,
        area(current_left, current_right)
      }
    end)
    |> Enum.sort_by(&elem(&1, 2), :desc)
  end

  def combinations(list) do
    list
    |> Enum.with_index()
    |> Enum.flat_map(fn {a, i} ->
      Enum.drop(list, i + 1)
      |> Enum.map(fn b -> [a, b] end)
    end)
  end

  def area(point_a, point_b) do
    Enum.zip(point_a, point_b)
    |> Enum.reduce(1, fn {left, right}, acc ->
      acc * (abs(right - left) + 1)
    end)
  end

  def line_to_list(str) do
    String.split(str, ",")
    |> Enum.reduce([], fn number, acc ->
      acc ++ [Integer.parse(number) |> elem(0)]
    end)
  end

  def part1(str) do
    String.split(str, "\n")
    |> Enum.reduce([], fn current, acc ->
      if String.length(current) > 0 do
        acc ++ [line_to_list(current)]
      else
        acc
      end
    end)
    |> pairwise_area()
    |> hd()
    |> elem(2)
  end

  def part2(_str) do
    :ok
  end
end
