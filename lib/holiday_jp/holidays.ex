defmodule HolidayJp.Holidays do
  @moduledoc false

  use GenServer

  def start_link, do: GenServer.start_link __MODULE__, [], name: __MODULE__

  @spec holidays :: [%HolidayJp.Holiday{}]
  def holidays, do: GenServer.call __MODULE__, :holidays

  @spec between(%Date{}, %Date{}) :: [%HolidayJp.Holiday{}]
  def between(start, last), do: GenServer.call __MODULE__, {:between, start, last}

  @spec holiday?(%Date{}) :: boolean
  def holiday?(date), do: GenServer.call __MODULE__, {:holiday?, date}

  def init([]) do
    holidays = :holiday_jp
    |> :code.priv_dir
    |> Path.join("holidays.ets")
    |> :erlang.binary_to_list
    |> :ets.file2tab
    |> elem(1)
    |> :ets.lookup(:holidays)
    |> Keyword.fetch!(:holidays)
    {:ok, holidays}
  end

  def handle_call(:holidays, _from, holidays), do: {:reply, holidays, holidays}

  def handle_call({:between, start, last}, _from, holidays) do
    between_holidays = Enum.filter holidays, fn %{date: date} ->
      comparison_to_start = Date.compare start, date
      comparison_to_last = Date.compare date, last
      (comparison_to_start == :lt or comparison_to_start == :eq) and
      (comparison_to_last == :lt or comparison_to_last == :eq)
    end
    {:reply, between_holidays, holidays}
  end

  def handle_call({:holiday?, date}, _from, holidays) do
    holiday? = Enum.any? holidays, &(&1.date == date)
    {:reply, holiday?, holidays}
  end
end
