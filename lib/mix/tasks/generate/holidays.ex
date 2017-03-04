defmodule Mix.Tasks.Generate.Holidays do
  @moduledoc false
  use Mix.Task

  @shortdoc "Generate the holidays DB"
  def run(_) do
    for app <- [:yamerl, :yaml_elixir], do: :ok = Application.start app
    src = __ENV__.file |> Path.dirname |> Path.join("../../../../holiday_jp/holidays_detailed.yml")
    dest = :holiday_jp |> :code.priv_dir |> Path.join("holidays.ets")
    holidays = src
    |> read_yaml_from_file
    |> Enum.map(fn {date_str, %{"date" => date_str, "week" => week, "week_en" => week_en, "name" => name, "name_en" => name_en}} ->
         date = Date.from_iso8601! date_str
         %HolidayJp.Holiday{
           date: date,
           week: week,
           week_en: week_en,
           name: name,
           name_en: name_en,
         }
       end)
    |> Enum.sort(&(Date.compare(&1.date, &2.date) == :lt))
    table = :ets.new :holiday_jp, [:set, :named_table]
    :ets.insert table, {:holidays, holidays}
    :ok = :ets.tab2file table, :erlang.binary_to_list(dest)
    :ets.delete table
  end

  defp read_yaml_from_file(file) do
    elem(Code.eval_quoted(quote(do: YamlElixir.read_from_file(var! file)), [file: file]), 0)
  end
end
