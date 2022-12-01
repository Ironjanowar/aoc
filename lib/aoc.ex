defmodule AOC do
  @callback parse(String.t()) :: any()
  @callback solve(any()) :: any()

  defmacro __using__(_) do
    quote do
      @behaviour AOC

      def test() do
        parse_and_solve("test_input")
      end

      def solve() do
        parse_and_solve("input")
      end

      defp parse_and_solve(file_name) do
        file_name |> parse_input() |> solve()
      end

      defp parse_input(file) do
        file |> File.read!() |> parse()
      end
    end
  end
end
