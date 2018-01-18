defmodule Mix.Tasks.Test.All do
  @moduledoc false
  use Mix.Task

  @shortdoc "Runs all lints & tests"
  def run(_) do
    IO.puts("+ mix cotton.lint")
    Mix.Task.run("cotton.lint")
    IO.puts("+ MIX_ENV=test mix test --color")
    {result, 0} = System.cmd("sh", ["-c", "MIX_ENV=test mix test --color"])
    IO.puts(result)
  end
end
