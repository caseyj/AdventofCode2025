defmodule Days.Day10Test do
  use ExUnit.Case
  alias Days.Day10, as: Module

  for {input, expected_output} <- [
        {".##.", [0, 1, 1, 0]},
        {"...#.", [0, 0, 0, 1, 0]},
        {".###.#", [0, 1, 1, 1, 0, 1]}
      ] do
    test "day10_test.exs function target_indicator_lights input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.target_indicator_lights(unquote(input)) ==
               unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
        {"3", %{3 => 1}},
        {"1,3", %{1 => 1, 3 => 1}},
        {"2", %{2 => 1}},
        {"2,3", %{2 => 1, 3 => 1}},
        {"0,2", %{0 => 1, 2 => 1}},
        {"0,1", %{0 => 1, 1 => 1}},
        {"0,1,2,3,4", %{0 => 1, 1 => 1, 2 => 1, 3 => 1, 4 => 1}}
      ] do
    test "day10_test.exs function button_map input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.button_map(unquote(input)) == unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
        {%{3 => 1}, [0, 0, 0, 1]},
        {%{1 => 1, 3 => 1}, [0, 1, 0, 1]},
        # shows the restriction with the length param
        {%{0 => 1, 1 => 1, 2 => 1, 3 => 1, 4 => 1}, [1, 1, 1, 1]}
      ] do
    test "day10_test.exs function button_vector input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.button_vector(unquote(Macro.escape(input)), 4) ==
               unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
        {"[.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}",
         %{
           :target => [0, 1, 1, 0],
           :buttons => [
             [0, 0, 0, 1],
             [0, 1, 0, 1],
             [0, 0, 1, 0],
             [0, 0, 1, 1],
             [1, 0, 1, 0],
             [1, 1, 0, 0]
           ]
         }}
      ] do
    test "day10_test.exs function get_line_map input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.get_line_map(unquote(input)) == unquote(Macro.escape(expected_output))
    end
  end

  for {{target_indicator, button_vector}, expected_output} <- [
        {{[0, 0, 0, 0], [0, 0, 0, 1]}, [0, 0, 0, 1]},
        {{[0, 0, 0, 1], [0, 0, 0, 1]}, [0, 0, 0, 0]},
        {{[0, 0, 0, 0], [1, 1, 1, 1]}, [1, 1, 1, 1]},
        {{[1, 1, 1, 1], [1, 1, 1, 1]}, [0, 0, 0, 0]}
      ] do
    test "day10_test.exs function button_result input #{inspect({target_indicator, button_vector})} expected output #{inspect(expected_output)}" do
      assert Module.button_result(unquote(target_indicator), unquote(button_vector)) ==
               unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
        {"[.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}", 2},
        {"[...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}", 3},
        {"[.###.#] (0,1,2,3,4) (0,3,4) (0,1,2,4,5) (1,2) {10,11,11,5,10,5}", 2}
      ] do
    test "day10_test.exs function bfs input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.bfs(Module.get_line_map(unquote(input))) ==
               unquote(Macro.escape(expected_output))
    end
  end

  test "day10_test.exs Part 1" do
    {:ok, data} = File.read("test/data/Day10.txt")
    assert Module.part1(data) == 7
  end
end
