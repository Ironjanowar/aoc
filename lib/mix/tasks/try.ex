defmodule Mix.Tasks.Try do
  use Mix.Task

  @impl Mix.Task
  def run(_) do
    app = Mix.Project.config()[:app]
    app_string = app |> Atom.to_string()

    app_module =
      app_string
      |> String.split("_")
      |> Enum.map(&String.capitalize/1)
      |> Enum.join("")

    module = String.to_existing_atom("Elixir.#{app_module}")

    Mix.shell().info(module.test())
  end
end
