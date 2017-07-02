defmodule HolidayJp do
  @moduledoc """
  Japanese holiday.
  """

  @type holiday :: %HolidayJp.Holiday{date: %Date{}, week: binary, week_en: binary, name: binary, name_en: binary}

  @doc """
  Returns holidays in Japan between start and last.

      iex> HolidayJp.between ~D[2016-03-01], ~D[2016-03-31]
      [
        %HolidayJp.Holiday{date: ~D[2016-03-20], week: "日", week_en: "Sunday", name: "春分の日", name_en: "Vernal Equinox Day"},
        %HolidayJp.Holiday{date: ~D[2016-03-21], week: "月", week_en: "Monday", name: "振替休日", name_en: "Holiday in lieu"},
      ]
  """
  @spec between(%Date{}, %Date{}) :: [holiday]
  def between(start, last), do: HolidayJp.Holidays.between start, last

  @doc """
  Detect the date is a holiday in Japan.

      iex> HolidayJp.holiday? ~D[2017-01-02]
      true

      iex> HolidayJp.holiday? ~D[2016-01-02]
      false
  """
  @spec holiday?(%Date{}) :: boolean
  def holiday?(date), do: HolidayJp.Holidays.holiday? date

  @doc """
  Returns a list of holidays on the date.

      iex> HolidayJp.on ~D[2017-02-11]
      [%HolidayJp.Holiday{date: ~D[2017-02-11], week: "土", week_en: "Saturday", name: "建国記念の日", name_en: "National Foundation Day"}]

      iex> HolidayJp.on ~D[2017-02-13]
      []
  """
  @spec on(%Date{}) :: [holiday]
  def on(date), do: HolidayJp.Holidays.between date, date
end
