defmodule Days.Day5 do
  def str_to_range(str) do
    range_members =
      String.split(str, "-")
      |> Enum.map(fn val ->
        Integer.parse(val)
        |> elem(0)
      end)
      |> List.to_tuple()

    elem(range_members, 0)..elem(range_members, 1)
  end

  def str_in_any_range(int, ranges) do
    Enum.reduce_while(ranges, 0, fn current_range, _acc ->
      if int in current_range do
        {:halt, 1}
      else
        {:cont, 0}
      end
    end)
  end

  def count_fresh({ranges, ids}) do
    Enum.reduce(ids, 0, fn current_id, acc -> acc + str_in_any_range(current_id, ranges) end)
  end

  def split_ranges_and_ids(str) do
    {ranges, ids} = String.split(str, "\n\n") |> List.to_tuple()

    {
      Enum.reduce(
        String.split(ranges, "\n"),
        [],
        fn current_range, acc -> acc ++ [str_to_range(current_range)] end
      ),
      Enum.reduce(
        String.split(ids, "\n"),
        [],
        fn current_id, acc ->
          if String.length(current_id) > 0 do
            acc ++
              [
                Integer.parse(current_id) |> elem(0)
              ]
          else
            acc
          end
        end
      )
    }
  end

  defp range_less_than_test(a, b) do
    b.first - a.last
  end

  def range_merge(a, b) do
    min(a.first, b.first)..max(a.last, b.last)
  end

  def handle_negative_potential_swap(a, b) do
    if range_less_than_test(b, a) < 2 do
      [range_merge(a, b)]
    else
      [b, a]
    end
  end

  def range_swap(a, b) do
    case range_less_than_test(a, b) do
      x when x >= 2 -> [a, b]
      x when x <= -2 -> handle_negative_potential_swap(a, b)
      _ -> [range_merge(a, b)]
    end
  end

  # FIXED
  def merge(left, right, acc \\ [])
  def merge([], right, acc), do: acc ++ right
  def merge(left, [], acc), do: acc ++ left

  def merge([a | left], [b | right], acc) do
    case range_swap(a, b) do
      [merged] ->
        merge(left, right, acc ++ [merged])

      [^a, ^b] ->
        merge(left, [b | right], acc ++ [a])

      [^b, ^a] ->
        merge([a | left], right, acc ++ [b])
    end
  end

  # FIXED
  def is_sorted([]), do: true
  def is_sorted([_]), do: true

  def is_sorted([a, b | tail]) do
    if range_less_than_test(a, b) >= 2 do
      is_sorted([b | tail])
    else
      false
    end
  end

  # FIXED
  def sort([]), do: []
  def sort([single]), do: [single]

  def sort(range_list) do
    {left, right} = Enum.split(range_list, div(length(range_list), 2))
    merged = merge(sort(left), sort(right))

    if is_sorted(merged) do
      merged
    else
      sort(merged)
    end
  end

  defp get_range_sum(ranges) do
    # +1 because the inclusive subtraction doesnt necessarily work
    Enum.reduce(sort(ranges), 0, fn current, acc -> acc + Range.size(current) end)
  end

  def part1(str) do
    split_ranges_and_ids(str)
    |> count_fresh()
  end

  def part2(str) do
    split_ranges_and_ids(str)
    |> elem(0)
    |> get_range_sum()
  end
end
