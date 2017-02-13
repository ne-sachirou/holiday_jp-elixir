defmodule HolidayJp.Holidays do
  @moduledoc false

  @holiday_names %{
    "元日" => "New Year's Day",
    "成人の日" => "Coming of Age Day",
    "建国記念の日" => "National Foundation Day",
    "春分の日" => "Vernal Equinox Day",
    "憲法記念日" => "Constitution Memorial Day",
    "みどりの日" => "Greenery Day",
    "こどもの日" => "Children's Day",
    "海の日" => "Marine Day",
    "山の日" => "Mountain Day",
    "敬老の日" => "Respect for the Aged Day",
    "秋分の日" => "Autumnal Equinox Day",
    "体育の日" => "Health and Sports Day",
    "文化の日" => "National Culture Day",
    "勤労感謝の日" => "Labor Thanksgiving Day",
    "天皇誕生日" => "Emperor's Birthday",
    "昭和の日" => "Showa Day",
    "振替休日" => "Holiday in lieu",
    "国民の休日" => "Citizen's Holiday",
    "即位礼正殿の儀" => "The Ceremony of the Enthronement of His Majesty th Emperor (at the Seiden)",
    "昭和天皇の大喪の礼" => "The Funeral Ceremony of Emperor Showa.",
    "皇太子徳仁親王の結婚の儀" => "The Rite of Wedding of HIH Crown Prince Naruhito"
  }

  @weeks {"月", "火", "水", "木", "金", "土", "日"}

  @weeks_en {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"}

  use GenServer

  def start_link do
    GenServer.start_link __MODULE__, [], name: __MODULE__
  end

  def holidays do
    GenServer.call __MODULE__, :holidays
  end

  def between(start, last) do
    GenServer.call __MODULE__, {:between, start, last}
  end

  def holiday?(date) do
    GenServer.call __MODULE__, {:holiday?, date}
  end

  def init([]) do
    holidays =
      :holiday_jp
      |> :code.priv_dir
      |> Path.join("holidays.yml")
      |> YamlElixir.read_from_file
      |> Enum.map(fn {date_str, name} ->
           date = Date.from_iso8601! date_str
           week_num = Date.day_of_week date
           %HolidayJp.Holiday{
             date: date,
             name: name,
             name_en: @holiday_names[name],
             week: elem(@weeks, week_num - 1),
             week_en: elem(@weeks_en, week_num - 1),
           }
         end)
      |> Enum.sort(&(Date.compare(&1.date, &2.date) == :lt))
    {:ok, holidays}
  end

  def handle_call(:holidays, _from, holidays) do
    {:reply, holidays, holidays}
  end

  def handle_call({:between, start, last}, _from, holidays) do
    between_holidays = Enum.filter holidays, fn %{date: holiday_date} ->
      comparison_to_start = Date.compare start, holiday_date
      comparison_to_last = Date.compare holiday_date, last
      (comparison_to_start == :lt || comparison_to_start == :eq) && (comparison_to_last == :lt || comparison_to_last == :eq)
    end
    {:reply, between_holidays, holidays}
  end

  def handle_call({:holiday?, date}, _from, holidays) do
    holiday? = Enum.any? holidays, &(&1.date == date)
    {:reply, holiday?, holidays}
  end
end
