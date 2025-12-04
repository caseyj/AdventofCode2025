defmodule Days.Day4Test do
  use ExUnit.Case
  alias Days.Day4, as: Module

  for {input, expected_output} <- [
        {{%{0 => %{}}, [], 0, 0, "@"}, {%{0 => %{0 => 1}}, [{0, 0}]}},
        {{%{0 => %{}}, [], 0, 0, "."}, {%{0 => %{0 => 0}}, []}},
        {{%{0 => %{0 => 1}, 1 => %{}}, [{0, 0}], 1, 3, "@"},
         {%{0 => %{0 => 1}, 1 => %{3 => 1}}, [{0, 0}, {1, 3}]}}
      ] do
    test "day4_test.exs function decision_for_map_and_list_hit input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.decision_for_map_and_list_hit(unquote(Macro.escape(input))) ==
               unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
        {".@.\n@.@",
         {%{0 => %{0 => 0, 1 => 1, 2 => 0}, 1 => %{0 => 1, 1 => 0, 2 => 1}},
          [{0, 1}, {1, 0}, {1, 2}]}}
      ] do
    test "day4_test.exs function str_map_to_list_hits input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.str_map_to_list_hits(unquote(input)) == unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
        {%{0 => %{0 => 0, 1 => 1, 2 => 0}, 1 => %{0 => 1, 1 => 0, 2 => 1}}, {2, 3}}
      ] do
    test "day4_test.exs function get_map_dims input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.get_map_dims(unquote(Macro.escape(input))) ==
               unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
        {{1, 1}, [{0, 0}, {0, 1}, {0, 2}, {1, 0}, {1,1},{1, 2}, {2, 0}, {2, 1}, {2, 2}]}
      ] do
    test "day4_test.exs function get_coordinate_box input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.get_coordinate_box(unquote(input)) == unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
        {{Module.get_coordinate_box({0,1}), {0,1}, {2,3}}, [{0,0}, {0,2}, {1,0}, {1,1}, {1,2}]}
      ] do
    test "day4_test.exs function filter_coordinates input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.filter_coordinates(unquote(Macro.escape(input))) == unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
      { {{1,1}, %{0=>%{0=>1, 1=>0, 2=>1}, 1=>%{0=>0, 1=>0, 2=>0}, 2=>%{0=>1, 1=>0, 2=>1}}, {3,3}}, 4},
    ] do
      test "day4_test.exs function get_sum_point_box input #{inspect(input)} expected output #{inspect(expected_output)}" do
        assert Module.get_sum_point_box(unquote(Macro.escape(input))) == unquote(Macro.escape(expected_output))
      end
    end

    test "day4_test.exs Part 1 test" do
      {:ok, data} = File.read("test/data/Day4.txt")
      assert Module.part1(data) == 13
    end

  test "day4_test.exs Part 2 test" do
    {:ok, data} = File.read("test/data/Day4.txt")
    assert Module.part2(data) == 43
  end

end
