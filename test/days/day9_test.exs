defmodule Days.Day9Test do
  use ExUnit.Case
  alias Days.Day9, as: Module

  for {{left, right}, expected_output} <- [
        {{[2, 5], [11, 1]}, 50},
        {{[2, 5], [9, 7]}, 24},
        {{[7, 1], [11, 7]}, 35},
        {{[7, 3], [2, 3]}, 6}
      ] do
    test "day9_test.exs function area input #{inspect({left, right})} expected output #{inspect(expected_output)}" do
      assert Module.area(unquote(left), unquote(right)) == unquote(expected_output)
    end
  end

  for {input, expected_output} <- [
        {[[2, 5], [11, 1], [2, 5], [9, 7], [7, 1], [11, 7], [2, 3], [7, 3]], 50}
      ] do
    test "day9_test.exs function pairwise_area input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.pairwise_area(unquote(Macro.escape(input)))
             |> hd()
             |> elem(2) == unquote(expected_output)
    end
  end

  test "day9_test Part1" do
    {:ok, data} = File.read("test/data/Day9.txt")
    assert Module.part1(data) == 50
  end
end
