defmodule AOC do
  defmacro __using__(_) do
    quote do
      def solve(), do: __MODULE__.solve()

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

      defp parse(text) do
        text
        |> String.split("\n\n")
        |> Enum.map(fn pack ->
          pack |> String.split("\n") |> Enum.map(&String.to_integer/1)
        end)
      end
    end
  end
end
