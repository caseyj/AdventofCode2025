defmodule Days.Day5Test do
  use ExUnit.Case
  alias Days.Day5, as: Module

  for {input, expected_output} <- [
        {"1-5", 1..5},
        {"100-500", 100..500}
      ] do
    test "day5_test.exs function str_to_range input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.str_to_range(unquote(input)) == unquote(Macro.escape(expected_output))
    end
  end

  for {{str, ranges}, expected_output} <- [
        {{1, [1..5, 15..25, 500..20000]}, 1},
        {{3, [1..5, 15..25, 500..20000]}, 1},
        {{15, [1..5, 15..25, 500..20000]}, 1},
        {{20, [1..5, 15..25, 500..20000]}, 1},
        {{25, [1..5, 15..25, 500..20000]}, 1},
        {{25_000_000, [1..5, 15..25, 500..20000]}, 0},
        {{27, [1..5, 15..25, 500..20000]}, 0}
      ] do
    test "day5_test.exs function str_in_any_range input #{inspect({str, ranges})} expected output #{inspect(expected_output)}" do
      assert Module.str_in_any_range(unquote(str), unquote(Macro.escape(ranges))) ==
               unquote(Macro.escape(expected_output))
    end
  end

  for {range_a, range_b, expected_output} <- [
      { 7..10, 5..6 , [5..10]},
    { 8..10, 5..6 , [5..6, 8..10]},

    ] do
      test "day5_test.exs function handle_negative_potential_swap input #{inspect({range_a, range_b})} expected output #{inspect(expected_output)}" do
        assert Module.handle_negative_potential_swap(unquote(Macro.escape(range_a)), unquote(Macro.escape(range_b))) == unquote(Macro.escape(expected_output))
      end
    end

  for {range_a, range_b, expected_output} <- [
    {1..5, 7..10, [1..5, 7..10]},
    {1..5, 6..10, [1..10]},
    {7..10, 1..5, [1..5, 7..10]},
    {6..10, 1..5, [1..10]}
  ] do
    test "day5_test.exs function range_swap input #{inspect({range_a, range_b})} expected output #{inspect(expected_output)}" do
      assert Module.range_swap(unquote(Macro.escape(range_a)), unquote(Macro.escape(range_b))) == unquote(Macro.escape(expected_output))
    end
  end

  for {range_a, range_b, expected_output} <- [
    {[1..2], [3..4], [1..4]},
    {[1..2, 10..12], [3..4, 6..8], [1..4, 6..8, 10..12]},
    {[1..2, 10..12], [3..4, 5..10, 6..8], [1..4, 5..12, 6..8]},
    {[1..2, 10..12], [0..500], [0..500, 10..12]}
  ] do
    test "day5_test.exs function merge input #{inspect({range_a, range_b})} expected output #{inspect(expected_output)}" do
      assert Module.merge(unquote(Macro.escape(range_a)), unquote(Macro.escape(range_b))) == unquote(Macro.escape(expected_output))
    end
  end
  
  for {input, expected_output} <- [
      { [3..5, 10..14, 16..20, 12..18] , [3..5, 10..20]},
    { [0..500,3..5, 10..14, 16..20, 12..18] , [0..500]},
    { [1000..10000, 0..500,3..5, 10..14, 16..20, 12..18, 500..1000] , [0..10000]},
    ] do
      test "day5_test.exs function sort input #{inspect(input)} expected output #{inspect(expected_output)}" do
        assert Module.sort(unquote(Macro.escape(input))) == unquote(Macro.escape(expected_output))
      end
    end

  test "day5_test.exs test Part 1" do
    {:ok, data} = File.read("test/data/Day5.txt")
    assert Module.part1(data) == 3
  end

  test "day5_test.exs test Part 2" do
    {:ok, data} = File.read("test/data/Day5.txt")
    assert Module.part2(data) == 14
  end


end
