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
  def holiday?(date) do
    HolidayJp.Holidays.holiday? date
  end
end
