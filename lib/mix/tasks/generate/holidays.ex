defmodule Mix.Tasks.Generate.Holidays do
  @moduledoc false

  use Mix.Task

  @shortdoc "Generate the holidays DB"
  def run(_) do
    :ok = Application.start(:yamerl)

    src =
      __ENV__.file |> Path.dirname() |> Path.join("../../../../holiday_jp/holidays_detailed.yml")

    dest = :holiday_jp |> :code.priv_dir() |> Path.join("holidays.ets")

    holidays =
      src
      |> File.read!()
      |> RelaxYaml.decode!()
      |> Enum.map(fn {date_str,
                      %{
                        "date" => date_str,
                        "week" => week,
                        "week_en" => week_en,
                        "name" => name,
                        "name_en" => name_en
                      }} ->
        %HolidayJp.Holiday{
          date: Date.from_iso8601!(date_str),
          week: week,
          week_en: week_en,
          name: name,
          name_en: name_en
        }
      end)
      |> Enum.sort(&(Date.compare(&1.date, &2.date) == :lt))

    table = :ets.new(:holiday_jp, [:set, :named_table])
    :ets.insert(table, {:holidays, holidays})
    :ok = :ets.tab2file(table, :erlang.binary_to_list(dest))
    :ets.delete(table)
  end
end
