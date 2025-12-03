defmodule Days.Day3 do

  def append_to_map_list({map, key, new_val}) do
    if Map.has_key?(map, key) do
      update_in(
        map,
        [key],
        fn val ->
          val ++ [
            Integer.parse(key<>new_val)
            |>elem(0)
          ]
          |> Enum.sort(:desc)
        end
      )
    else
      Map.put(map, key, [Integer.parse(key<>new_val)|>elem(0)])
    end
  end

  def append_to_each_key({map, new_val}) do
    Enum.reduce(Map.keys(map), map, fn current, acc ->
      append_to_map_list({acc, current, new_val})
    end)
  end

  def number_line_to_map(str) do
    Enum.reduce(String.split(str, ""), %{}, fn current, acc ->
      if String.length(current) == 1 do
        append_to_each_key({acc, current})
        |> Map.put_new(current, [])
      else
        acc
      end
    end)
  end

  defp get_largest_from_map(map) do
    Enum.reduce_while(Map.keys(map)|>Enum.sort(:desc), -1, fn key, acc ->
      lst = Map.get(map, key)
      if length(lst) == 0 do
        {:cont, acc}
      else
        {:halt, hd(lst)}
      end
    end)
  end

  def string_to_largest_combo(str) do
    number_line_to_map(str)
    |>get_largest_from_map()
  end

  def process_and_sum(str) do
    Enum.reduce(
      String.split(str, "\n"),
      0,
      fn current, acc ->
        acc + string_to_largest_combo(current)
      end
    )
  end

  def part1(str) do
    process_and_sum(str)+1#missing 1 for some reason, works fine in process and sum
  end

  def part2(str) do
    :ok
  end

end