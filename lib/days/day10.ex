defmodule Days.Day10 do
  def target_indicator_lights(str) do
    Enum.reduce(String.split(str, ""), [], fn current, acc ->
      case current do
        "." -> acc ++ [0]
        "#" -> acc ++ [1]
        _ -> acc
      end
    end)
  end

  def button_map(str) do
    Enum.reduce(String.split(str, ","), %{}, fn current, acc ->
      if String.length(current) > 0 do
        {int, _idc} = Integer.parse(current)
        Map.put(acc, int, 1)
      else
        acc
      end
    end)
  end

  def button_vector(button_map, indicator_light_length) do
    Enum.reduce(0..(indicator_light_length - 1), [], fn current, acc ->
      case Map.get(button_map, current) do
        nil -> acc ++ [0]
        _ -> acc ++ [1]
      end
    end)
  end

  def button_result(target_indicator, button_vector) do
    Enum.reduce(Enum.zip(button_vector, target_indicator), [], fn {left, right}, acc ->
      acc ++ [Integer.mod(left + right, 2)]
    end)
  end

  def generate_options(current_indicators, button_vectors) do
    Enum.map(button_vectors, fn current_vector ->
      button_result(current_indicators, current_vector)
    end)
  end

  def bfs(map) do
    target = Map.get(map, :target)
    bfs([{List.duplicate(0, length(target)), 0}], target, Map.get(map, :buttons), %{})
  end

  def bfs([], target, button_vectors, seen_map) do
    -1
  end

  def bfs([{light_vector, count} | queue_tl], target, button_vectors, seen_map) do
    if light_vector == target do
      count
    else
      sm_updated = Map.put(seen_map, light_vector, count)

      (queue_tl ++
         Enum.reduce(
           generate_options(light_vector, button_vectors),
           [],
           fn current_option, acc ->
             if Map.has_key?(seen_map, current_option) do
               acc
             else
               acc ++ [{current_option, count + 1}]
             end
           end
         ))
      |> bfs(target, button_vectors, sm_updated)
    end
  end

  def get_line_map(str) do
    Enum.reduce(String.split(str, "\s"), %{:target => [], :buttons => []}, fn current, acc ->
      cond do
        match = Regex.run(~r/\(([^)]*)\)/, current) ->
          target_size = length(Map.get(acc, :target))
          vec = button_map(hd(tl(match))) |> button_vector(target_size)
          update_in(acc, [:buttons], &(&1 ++ [vec]))

        match = Regex.run(~r/\[([^]]*)\]/, current) ->
          update_in(acc[:target], &((&1 ++ hd(tl(match))) |> target_indicator_lights()))

        true ->
          acc
      end
    end)
  end

  def part1(str) do
    Enum.reduce(String.split(str, "\n"), 0, fn current, acc ->
      IO.puts(acc)
      acc + (get_line_map(current) |> bfs())
    end)
  end

  def part2(_str) do
    :ok
  end
end
