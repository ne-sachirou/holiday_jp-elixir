defmodule HolidayJp.Holiday do
  @moduledoc """
  Holiday.
  """

  @doc """
  Holiday.

      iex> %HolidayJp.Holiday{date: ~D[2017-11-23], week: "木", week_en: "Thursday", name: "勤労感謝の日", name_en: "Labor Thanksgiving Day"}
      %HolidayJp.Holiday{date: ~D[2017-11-23], week: "木", week_en: "Thursday", name: "勤労感謝の日", name_en: "Labor Thanksgiving Day"}
  """
  defstruct date: ~D[1970-01-01], week: "", week_en: "", name: "", name_en: ""
end
