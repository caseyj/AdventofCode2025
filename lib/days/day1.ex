defmodule Days.Day1 do

    def letter_number_split(command) do
        {String.first(command) , String.to_integer(String.slice(command, 1..-1//1))}
    end

    def choose_direction({direction, amount}, start) do
      case direction do
            "R" -> do_addition(amount, start)
            "L" -> do_subtraction(amount, start)
        end
    end

    defp do_subtraction(amount, start) do
        do_addition((amount * -1), start)
    end

    defp do_addition(amount, start) do
        (start + amount)
    end

    def decide_zero({new_start, count}) do
      if new_start == 0 do
        count+1
      else
        count
      end
    end

    def rotate("L" <> clicks, pos) do
      clicks = String.to_integer(clicks)
      times =
        cond do
          # Start at 0, count every 100
          pos == 0 -> div(clicks, 100)
          # Cross 0 at pos clicks, then every 100
          clicks >= pos -> 1 + div(clicks - pos, 100)
          # Don't reach 0
          true -> 0
        end
      times
    end


    def rotate("R" <> clicks, pos) do
      clicks = String.to_integer(clicks)
      threshold = 100 - pos
      times = if clicks >= threshold, do: 1 + div(clicks - threshold, 100), else: 0
      times
    end


    def run_command(command, {current_start, current_pt_1_count, current_pt2_count}, max \\ 100) do
      if String.length(command) > 0 do
        {letter, number} = letter_number_split(command)
        arithmetic_result = choose_direction({letter, number}, current_start)
        new_start = Integer.mod(arithmetic_result, max)
        pt_1_count = decide_zero(
          {new_start, current_pt_1_count}
        )
        pt_2_count = current_pt2_count + rotate(command, current_start)
        {new_start, pt_1_count, pt_2_count}
      else
        {current_start, current_pt_1_count, current_pt2_count}
      end
    end

    def do_run_multiple_commands(commands, start \\50, max \\ 100) do
      Enum.reduce(commands, {start, 0, 0}, fn current_command, {current_start, current_pt_1_count, current_pt2_count} ->
        run_command(current_command, {current_start, current_pt_1_count, current_pt2_count}, max)
      end)
    end


    def part1(string_data) do
      String.split(string_data, "\n")
      |>do_run_multiple_commands()
      |> elem(1) # grabs our count variable
    end

    def part2(string_data) do
     String.split(string_data, "\n")
      |>do_run_multiple_commands()
      |>elem(2) # grabs our count variable
    end

end
