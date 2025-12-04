defmodule Days.Day3Test do
  use ExUnit.Case
  alias Days.Day3, as: Module

  for {input, expected_output} <- [
        {{%{"9" => [91]}, "9", "2"}, %{"9" => [92, 91]}},
        {{%{}, "9", "2"}, %{"9" => [92]}}
      ] do
    test "Module function append_to_map_list input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.append_to_map_list(unquote(Macro.escape(input))) ==
               unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
        {{%{"9" => [91]}, "2"}, %{"9" => [92, 91]}},
        {{%{"9" => [91], "1" => []}, "2"}, %{"9" => [92, 91], "1" => [12]}}
      ] do
    test "Module function append_to_each_key input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.append_to_each_key(unquote(Macro.escape(input))) ==
               unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
        {"912", %{"9" => [92, 91], "1" => [12], "2" => []}}
      ] do
    test "Module function number_line_to_map input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.number_line_to_map(unquote(input)) == unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
        {"912", 92},
        {"987654321111111", 98},
        {"811111111111119", 89},
        {"234234234234278", 78},
        {"818181911112111", 92}
      ] do
    test "Module function string_to_largest_combo input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.string_to_largest_combo(unquote(input)) == unquote(expected_output)
    end
  end

  for {input, expected_output} <- [
        {"987654321111111\n811111111111119\n234234234234278\n818181911112111", 357}
      ] do
    test "Module function process_and_sum input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Module.process_and_sum(unquote(input)) == unquote(expected_output)
    end
  end

  test "Day3 part1" do
    {:ok, data} = File.read("test/data/Day3.txt")
    assert Module.part1(data) == 357
  end
end
