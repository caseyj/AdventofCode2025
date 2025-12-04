defmodule Days.Day4Test do
  use ExUnit.Case
  alias Days.Day4, as: Module

  for {input, expected_output} <- [
      { {%{0=>%{}}, [], 0,0,"@"} , {%{0=>%{0=>1}}, [{0,0}]}},
      { {%{0=>%{}}, [], 0,0,"."} , {%{0=>%{0=>0}}, []}},
      { {%{0=>%{0=>1}, 1=>%{}}, [{0,0}], 1,3,"@"} , {%{0=>%{0=>1}, 1=>%{3=>1}}, [{0,0}, {1,3}]}},

    ] do
      test "day4_test.exs function decision_for_map_and_list_hit input #{inspect(input)} expected output #{inspect(expected_output)}" do
        assert Module.decision_for_map_and_list_hit(unquote(Macro.escape(input))) == unquote(Macro.escape(expected_output))
      end
  end


  for {input, expected_output} <- [
      { ".@.\n@.@" , {%{0=>%{0=>0, 1=>1, 2=>0},1=>%{0=>1, 1=>0, 2=>1}}, [{0,1}, {1,0}, {1,2}]}},

    ] do
      test "day4_test.exs function str_map_to_list_hits input #{inspect(input)} expected output #{inspect(expected_output)}" do
        assert Module.str_map_to_list_hits(unquote(input)) == unquote(Macro.escape(expected_output))
      end
    end

end