defmodule Mix.Tasks.Generate.Holidays do
  @moduledoc false
  use Mix.Task

  @shortdoc "Generate the holidays DB"
  def run(_) do
    src = __ENV__.file
    |> Path.dirname
    |> Path.join("../../../../holiday_jp/holidays.yml")
    dest = :holiday_jp
    |> :code.priv_dir
    |> Path.join("holidays.yml")
    File.cp! src, dest
  end
end
