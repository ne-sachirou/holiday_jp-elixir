defmodule Mix.Tasks.Update.Deps do
  @moduledoc false
  use Mix.Task

  @shortdoc "Update all dependencies."
  def run(_) do
    IO.puts "+ mix deps.update --all"
    Mix.Task.run "deps.update", ["--all"]
    IO.puts "+ git submodule update --remote"
    {result, 0} = System.cmd "git", ["submodule", "update", "--remote"]
    IO.puts result
    IO.puts "+ mix generate.holidays"
    Mix.Task.run "generate.holidays"
  end
end
