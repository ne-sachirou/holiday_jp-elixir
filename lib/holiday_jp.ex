defmodule HolidayJp do
  @moduledoc """
  Japanese holiday.
  """

  @doc """
  Returns holidays in Japan between start and last.

      iex> HolidayJp.between ~D[2016-03-01], ~D[2016-03-31]
      [
        %HolidayJp.Holiday{date: ~D[2016-03-20], name: "春分の日", name_en: "Vernal Equinox Day", week: "日", week_en: "Sunday"},
        %HolidayJp.Holiday{date: ~D[2016-03-21], name: "振替休日", name_en: "Holiday in lieu", week: "月", week_en: "Monday"},
      ]
  """
  @spec between(%Date{}, %Date{}) :: list(%HolidayJp.Holiday{})
  def between(start, last) do
    HolidayJp.Holidays.between start, last
  end

  @doc """
  Detect the date is a holiday in Japan.

      iex> HolidayJp.holiday? ~D[2017-01-02]
      true

      iex> HolidayJp.holiday? ~D[2016-01-02]
      false
  """
  @spec holiday?(%Date{}) :: boolean
  def holiday?(date) do
    HolidayJp.Holidays.holiday? date
  end

  @doc """
  Returns a list of holidays on the date.

      iex> HolidayJp.on ~D[2017-02-11]
      [%HolidayJp.Holiday{date: ~D[2017-02-11], name: "建国記念の日", name_en: "National Foundation Day", week: "土", week_en: "Saturday"}]

      iex> HolidayJp.on ~D[2017-02-13]
      []
  """
  @spec on(%Date{}) :: list(%HolidayJp.Holiday{})
  def on(date) do
    HolidayJp.Holidays.between date, date
  end
end
