defmodule Mix.Tasks.Try do
  use Mix.Task

  @impl Mix.Task
  def run([module]) do
    module = String.to_existing_atom(module)
    Mix.shell().info(module.test())
  end
end
