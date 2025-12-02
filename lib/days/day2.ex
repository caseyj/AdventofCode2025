defmodule Days.Day2 do


  def generate_numbers_in_range(range_start, range_end) do
    Enum.reduce(range_start..range_end, [], fn current,acc ->
        acc ++ [Integer.to_string(current)]
      end
    )
  end

  def part1(_string_data) do
    :ok
  end

  def part2(_string_data) do
    :ok
  end

end