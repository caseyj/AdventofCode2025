defmodule Days.Day1Test do
  use ExUnit.Case
  alias Days.Day1, as: Day1

  for {input, expected_output} <- [
    {"L68", {"L", 68}},
    {"L30", {"L", 30}},
    {"R48", {"R", 48}},
    {"L5", {"L", 5}},
    {"R60", {"R", 60}},
    {"L55", {"L", 55}},
    {"L1", {"L", 1}},
    {"L99", {"L", 99}},
    {"R14", {"R", 14}},
    {"L82", {"L", 82}},
  ] do
    test "Day1 function letter_number_split input #{input} expected output #{inspect(expected_output)}" do
      assert Day1.letter_number_split(unquote(input)) == unquote(expected_output)
    end
  end

  for {input, expected_output} <- [
    {{"L68", 50}, 82},
    {{"L30", 82}, 52},
    {{"R48", 52}, 0},
    {{"L5", 0}, 95},
    {{"R60", 95}, 55},
    {{"L55", 55}, 0},
    {{"L1", 0}, 99},
    {{"L99", 99}, 0},
    {{"R14", 0}, 14},
    {{"L82", 14}, 32},
  ] do
    test "Day1 function choose_direction input #{inspect(input)} expected output #{inspect(expected_output)}" do
      {command, start} = unquote(input)
      assert Day1.choose_direction(Day1.letter_number_split(command), start)|>Integer.mod(100) == unquote(expected_output)
    end
  end

  for {input, expected_output} <- [
    { {0,0} , 1},
    { {20,0} , 0},
    { {0,1} , 2},
    { {40,2} , 2},
  ] do
    test "Day1 function decide_zero input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Day1.decide_zero(unquote(input)) == unquote(expected_output)
    end
  end

  for {input, expected_output} <- [
    {{"R1000",{50, 0, 0}}, {50, 0, 10}},
    {{"L1000",{50, 0, 0}}, {50, 0, 10}},
    {{"L68",{50, 0, 0}}, {82, 0, 1}},
    {{"L30",{82, 0, 1}}, {52, 0, 1}},
    {{"R48",{52, 0, 1}}, {0, 1, 2}},
    {{"L5",{0, 1, 1}}, {95, 1, 1}},
    {{"R60",{95, 1, 1}}, {55, 1, 2}},
    {{"L55",{55, 1, 2}}, {0, 2, 3}},
    {{"L1",{0, 2, 2}}, {99, 2, 2}},
    {{"L99",{99, 2, 2}}, {0, 3, 3}},
    {{"R14",{0, 3, 2}}, {14, 3, 2}},
    {{"L82",{14, 3, 2}}, {32, 3, 3}}
  ] do
    test "Day1 function run_command input #{inspect(input)} expected output #{inspect(expected_output)}" do
      {command, settings} = unquote(Macro.escape(input))
      assert Day1.run_command(command, settings) == unquote(Macro.escape(expected_output))
    end
  end

  for {input, expected_output} <- [
    { ["L68", "L30", "R48","L5","R60","L55","L1", "L99","R14","L82"] , {32, 3, 6}},

  ] do
    test "Day1 function do_run_multiple_commands input #{inspect(input)} expected output #{inspect(expected_output)}" do
      assert Day1.do_run_multiple_commands(unquote(input)) == unquote(Macro.escape(expected_output))
    end
  end

  test "Live Data Test Part 1" do
    {:ok, data} = File.read("test/data/Day1.txt")
    assert Day1.part1(data) == 3
  end

  test "Live Data Test Part 2" do
    {:ok, data} = File.read("test/data/Day1.txt")
    assert Day1.part2(data) == 6
  end

end
