defmodule Days.Day6Test do
  use ExUnit.Case
  alias Days.Day6, as: Module

  test "day5_test.exs test Part 1" do
    {:ok, data} = File.read("test/data/Day6.txt")
    assert Module.part1(data) == :ok
  end

  test "day5_test.exs test Part 2" do
    {:ok, data} = File.read("test/data/Day6.txt")
    assert Module.part2(data) == :ok
  end
end
