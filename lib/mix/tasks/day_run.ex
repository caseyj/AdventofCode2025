defmodule Mix.Tasks.DayRun do

  use Mix.Task

  @impl Mix.Task
  def run(args) do
    args_n = List.to_tuple(args)
    module_name = "Elixir.Days.#{elem(args_n, 0)}"
    module = String.to_existing_atom(module_name)
    filename = "data/#{String.downcase(elem(args_n, 0))}.txt"
    {:ok, data} = File.read(filename)
    IO.inspect(module.part1(data))
    IO.inspect(module.part2(data))
  end
end