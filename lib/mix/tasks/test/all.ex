defmodule Mix.Tasks.Test.All do
  @moduledoc false
  use Mix.Task

  @shortdoc "Runs all lints & tests"
  def run(_) do
    Mix.Task.run "dogma"
    Mix.Task.run "dialyzer"
    {result, 0} = System.cmd "sh", ["-c", "MIX_ENV=test mix test"]
    IO.puts result
  end
end
