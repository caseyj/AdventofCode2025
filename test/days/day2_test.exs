defmodule Days.Day2Test do
  use ExUnit.Case
  alias Days.Day2, as: Module


  for {input, expected_output} <- [
    {{1,2}, ["1","2"]},
    {{1,3}, ["1","2", "3"]},
    {{1,9}, ["1","2", "3","4","5","6","7","8","9"]},

  ] do
    test "Module function generate_numbers_in_range input #{inspect(input)} expected output #{inspect(expected_output)}" do

      assert Module.generate_numbers_in_range(unquote(input)) == unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
    {"1-2", {1,2}},
    {"1-3", {1,3}},
    {"1-9", {1,9}},
    {"11-19", {11,19}},
  ] do
    test "Module function string_to_range_params input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.string_to_range_params(unquote(input)) == unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
    {"12", false},
    {"13", false},
    {"19", false},
    {"11", true},
    {"22", true},
    {"99", true},
    {"1010", true},
    {"1188511885", true},
    {"446446", true},
    {"38593859", true},
  ] do
    test "Module function id_violation input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.id_violation(unquote(input)) == unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
    {"11-22", 33},
    {"95-115", 99},
    {"998-1012", 1010},
    {"1188511880-1188511890", 1188511885},
    {"222220-222224", 222222},
    {"1698522-1698528", 0},
    {"446443-446449", 446446},
    {"38593856-38593862", 38593859},
  ] do
    test "Module function range_str_to_count input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.range_str_to_count(unquote(input)) == unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
    {"11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124",1227775554 },
  ] do
    test "Module function sum_of_ranges input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.sum_of_ranges(unquote(input)) == unquote(Macro.escape(expected_output))
    end
  end

  test "Day2 Part 1 test" do
    {:ok, data} = File.read("test/data/Day2.txt")
    assert Module.part1(data) == 1227775554
  end

end