defmodule Mix.Tasks.Make do
  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    app = Mix.Project.config()[:app]
    app_string = app |> Atom.to_string()

    app_module =
      app_string |> String.split("_") |> Enum.map(&String.capitalize/1) |> Enum.join("")

    makefile = """
    test:
    \tmix run -e "#{app_module}.test()"

    solve:
    \tmix run -e "#{app_module}.solve()"
    """

    File.write!("Makefile", makefile)
  end
end
