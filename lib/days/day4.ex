defmodule Days.Day4 do
  defp split_str_to_list_and_zip(str, split_character) do
    split_str =
      String.split(str, split_character)
      |> Enum.reduce([], fn current, acc ->
        if String.length(current) != 0 do
          acc ++ [String.trim(current)]
        else
          acc
        end
      end)

    split_str_length = length(split_str)
    Enum.zip(split_str, Enum.to_list(0..split_str_length))
  end

  def decision_for_map_and_list_hit({map, list, row_name, column_name, value}) do
    case value do
      "@" -> {put_in(map, [row_name, column_name], 1), list ++ [{row_name, column_name}]}
      "." -> {put_in(map, [row_name, column_name], 0), list}
      _ -> {map, list}
    end
  end

  def str_map_to_list_hits(str) do
    Enum.reduce(
      split_str_to_list_and_zip(str, "\n"),
      {%{}, []},
      fn {current_row, row_name}, {map_acc, list_acc} ->
        map_new_row = Map.put(map_acc, row_name, %{})

        Enum.reduce(
          split_str_to_list_and_zip(String.trim(current_row), ""),
          {map_new_row, list_acc},
          fn {current_val, column_name}, {tacc_map, tacc_list} ->
            decision_for_map_and_list_hit(
              {tacc_map, tacc_list, row_name, column_name, current_val}
            )
          end
        )
      end
    )
  end

  def get_map_dims(map) do
    row_count = length(Map.keys(map))
    column_count = length(Map.keys(Map.get(map, 0)))
    {row_count, column_count}
  end

  def get_coordinate_box({row_name, column_name}) do
    coordinate_checkpoints = for x <- [-1, 0, 1], y <- [-1,0,1] do {x, y} end
    Enum.reduce(
      coordinate_checkpoints,
      [],
      fn {c_row, c_col}, acc ->
        acc ++ [{c_row + row_name, c_col + column_name}]
      end
    )
  end

  def filter_coordinates({coordinate_list, {center_row, center_col}, {grid_max_row, grid_max_col}}) do
    Enum.reduce(coordinate_list, [], fn {row, col}, acc ->
      cond do
        row >= grid_max_row -> acc
        col >= grid_max_col -> acc
        row < 0 -> acc
        col < 0 -> acc
        center_row == row && center_col == col -> acc
        true -> acc ++ [{row, col}]
      end
    end)
  end

  def get_sum_point_box({coordinates, map, grid_maximums}) do
    filter_coordinates({get_coordinate_box(coordinates), coordinates, grid_maximums})
    |> Enum.reduce(0, fn coordinate_pair, acc ->
      acc + get_in(map, Tuple.to_list(coordinate_pair))
    end)
  end

  defp find_accessible_rolls({map, roll_coords}) do
    grid_maximums = get_map_dims(map)
    Enum.reduce(roll_coords, 0, fn current_roll, acc ->
      if get_sum_point_box({current_roll, map, grid_maximums}) < 4 do
        acc + 1
      else
        acc
      end
    end)
  end

  def part1(str) do
    str_map_to_list_hits(str)
    |> find_accessible_rolls()
  end

  def part2(_str) do
    :ok
  end

end
