defmodule Days.Day2Test do
  use ExUnit.Case
  alias Days.Day2, as: Module


  for {input, expected_output} <- [
    {{1,2}, ["1","2"]},
    {{1,3}, ["1","2", "3"]},
    {{1,9}, ["1","2", "3","4","5","6","7","8","9"]},

  ] do
    test "Module function generate_numbers_in_range input #{inspect(input)} expected output #{inspect(expected_output)}" do
      {range_start, range_end} = unquote(input)
      assert Module.generate_numbers_in_range(range_start, range_end) == unquote(Macro.escape(expected_output))
    end
  end

end