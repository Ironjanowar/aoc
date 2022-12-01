defmodule Mix.Tasks.Try do
  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    Mix.shell().info(Cuwano.test())
  end
end
