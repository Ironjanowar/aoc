defmodule Mix.Tasks.Try do
  use Mix.Task

  @impl Mix.Task
  def run(["Elixir." <> _ = module]), do: module |> String.to_existing_atom() |> execute
  def run([module]), do: ("Elixir." <> module) |> String.to_existing_atom() |> execute
  def run(_), do: raise("Invalid args, pass the module with the AOC behaviour implemented")

  defp execute(module), do: Mix.shell().info(module.test())
end
