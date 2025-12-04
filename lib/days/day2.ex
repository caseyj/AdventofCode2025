defmodule Days.Day2 do
  def lexicographic_string_array(str) do
    tot_length = String.length(str)

    Enum.reduce(0..(tot_length - 1), [], fn current, acc ->
      acc ++ [String.slice(str, current, tot_length)]
    end)
  end

  def mod_3_lexicographic_strings(str) do
    lex_array = lexicographic_string_array(str)

    Enum.zip(lex_array, 0..length(lex_array))
    |> Enum.reduce(%{0 => [], 1 => [], 2 => []}, fn current, acc ->
      case Integer.mod(elem(current, 1), 3) do
        0 -> update_in(acc[0], fn lex_list -> lex_list ++ [current] end)
        1 -> update_in(acc[1], fn lex_list -> lex_list ++ [current] end)
        2 -> update_in(acc[2], fn lex_list -> lex_list ++ [current] end)
      end
    end)
  end

  def get_trigram(str) do
    str_length = String.length(str)

    if str_length >= 3 do
      String.slice(str, 0..2)
    else
      String.pad_trailing(str, 3, "*")
    end
  end

  def id_violation(id) do
    str_length = String.length(id)

    if Integer.mod(str_length, 2) == 0 do
      half = div(str_length, 2)
      String.slice(id, 0..(half - 1)) == String.slice(id, half..str_length)
    else
      false
    end
  end

  def range_str_to_count(str) do
    string_to_range_params(str)
    |> generate_numbers_in_range()
    |> count_violations_in_range()
  end

  def sum_of_ranges(range_list) do
    Enum.reduce(String.split(range_list, ","), 0, fn current, acc ->
      acc + range_str_to_count(current)
    end)
  end

  def count_violations_in_range(range) do
    Enum.reduce(range, 0, fn current, acc ->
      if id_violation(current) do
        acc + (Integer.parse(current) |> elem(0))
      else
        acc
      end
    end)
  end

  def string_to_range_params(str) do
    String.split(str, "-")
    |> Enum.map(fn current -> String.to_integer(current) end)
    |> List.to_tuple()
  end

  def generate_numbers_in_range({range_start, range_end}) do
    Enum.map(range_start..range_end, fn current -> Integer.to_string(current) end)
  end

  def part1(string_data) do
    sum_of_ranges(String.trim(string_data))
  end

  def part2(_string_data) do
    :ok
  end
end
