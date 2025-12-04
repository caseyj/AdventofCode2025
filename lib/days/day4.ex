defmodule Days.Day4 do

  defp split_str_to_list_and_zip(str, split_character) do
    split_str = String.split(str, split_character)
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
      "@" -> { put_in(map, [row_name, column_name], 1), list ++ [{row_name, column_name}]}
      "." ->  { put_in(map, [row_name, column_name], 0), list}
      _ -> {map, list}
    end
  end


  def str_map_to_list_hits(str) do
    Enum.reduce(
      split_str_to_list_and_zip(str, "\n"),
      {%{},[]},
      fn {current_row, row_name}, {map_acc,list_acc} ->
        map_new_row = Map.put(map_acc, row_name, %{})
        Enum.reduce(
          split_str_to_list_and_zip(String.trim(current_row), ""),
          {map_new_row,list_acc},
          fn {current_val, column_name}, {tacc_map, tacc_list} ->
            decision_for_map_and_list_hit(
              {tacc_map, tacc_list, row_name, column_name, current_val}
            )
          end)
      end)
  end

end