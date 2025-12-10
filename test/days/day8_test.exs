defmodule Days.Day8Test do
  use ExUnit.Case
  alias Days.Day8, as: Module

  for {input, expected_output} <- [
        {[{1, 3}, {1, 2}, {4, 5}], [{{1, 3}, {1, 2}}, {{1, 3}, {4, 5}}, {{1, 2}, {4, 5}}]}
      ] do
    test "day8_test.exs function combinations input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.combinations(unquote(input)) == unquote(Macro.escape(expected_output))
    end
  end
end
