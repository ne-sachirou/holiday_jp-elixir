defmodule HolidayJp.Holiday do
  @moduledoc """
  Holiday.
  """

  @doc """
  Holiday.

      iex> %HolidayJp.Holiday{date: ~D[2017-11-23], name: "勤労感謝の日", name_en: "Labor Thanksgiving Day", week: "木", week_en: "Thursday"}
      %HolidayJp.Holiday{date: ~D[2017-11-23], name: "勤労感謝の日", name_en: "Labor Thanksgiving Day", week: "木", week_en: "Thursday"}
  """
  defstruct date: ~D[1970-01-01], name: "", name_en: "", week: "", week_en: ""
end
